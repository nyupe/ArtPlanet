<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
    /* ============================================================================== */
    /* =   PAGE : ���� ��û ó�� PAGE                                               = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ������ ������ �߻��ϴ� ��� �Ʒ��� �ּҷ� �����ϼż� Ȯ���Ͻñ� �ٶ��ϴ�.= */
    /* =   ���� �ּ� : http://testpay.kcp.co.kr/pgsample/FAQ/search_error.jsp       = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2008   KCP Inc.   All Rights Reserverd.                   = */
    /* ============================================================================== */
%>
<%!
    /* ============================================================================== */
    /* =   null ���� ó���ϴ� �޼ҵ�                                                = */
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
    /* = ���̺귯�� �� ����Ʈ ���� include                                          = */
    /* = -------------------------------------------------------------------------- = */
%>
    <%@ page import="com.kcp.*"%>
    <%@ page import="java.net.URLEncoder"%>
    <%@ include file="../../cfg/site_conf_inc.jsp"%>
<%
    /* ============================================================================== */

    request.setCharacterEncoding ( "euc-kr" ) ;
    /* ============================================================================== */
    /* =   01. ���� ��û ���� ����                                                  = */
    /* = -------------------------------------------------------------------------- = */
    String    pay_method = f_get_parm( request.getParameter( "pay_method" ) );  // ���� ���
    String    ordr_idxx  = f_get_parm( request.getParameter( "ordr_idxx"  ) );  // �ֹ� ��ȣ
    String    good_name  = f_get_parm( request.getParameter( "good_name"  ) );  // ��ǰ ����
    String    good_mny   = f_get_parm( request.getParameter( "good_mny"   ) );  // ���� �ݾ�
    String    buyr_name  = f_get_parm( request.getParameter( "buyr_name"  ) );  // �ֹ��� �̸�
    String    buyr_mail  = f_get_parm( request.getParameter( "buyr_mail"  ) );  // �ֹ��� E-Mail
    String    buyr_tel1  = f_get_parm( request.getParameter( "buyr_tel1"  ) );  // �ֹ��� ��ȭ��ȣ
    String    buyr_tel2  = f_get_parm( request.getParameter( "buyr_tel2"  ) );  // �ֹ��� �޴�����ȣ
    String    req_tx     = f_get_parm( request.getParameter( "req_tx"     ) );  // ��û ����
    String    currency   = f_get_parm( request.getParameter( "currency"   ) );  // ȭ����� (WON/USD)
    /* = -------------------------------------------------------------------------- = */
    String    mod_type      = f_get_parm( request.getParameter( "mod_type"     ) ); // ����TYPE(������ҽ� �ʿ�)
    String    mod_desc      = f_get_parm( request.getParameter( "mod_desc"     ) ); // �������
    String    amount        = "";                                                   // �� �ݾ�
    String    panc_mod_mny  = "";                                                   // �κ���� ��û�ݾ�
    String    panc_rem_mny  = "";                                                   // �κ���� ���ɱݾ�
    /* = -------------------------------------------------------------------------- = */
    String    tran_cd    = "";                                                  // Ʈ����� �ڵ�
    String    bSucc      = "";                                                  // DB �۾� ���� ����
    /* = -------------------------------------------------------------------------- = */
    String    res_cd     = "";                                                  // ����ڵ�
    String    res_msg    = "";                                                  // ����޽���
    String    tno        = "";                                                  // �ŷ���ȣ
    /* = -------------------------------------------------------------------------- = */
    String    card_pay_method = f_get_parm( request.getParameter( "card_pay_method" ) );  // ī�� ���� ���
    String    card_cd         = "";                                                       // ī�� �ڵ�
    String    card_no         = "";                                                       // ī�� ��ȣ
    String    card_name       = "";                                                       // ī���
    String    app_time        = "";                                                       // ���νð�
    String    app_no          = "";                                                       // ���ι�ȣ
    String    noinf           = "";                                                       // �����ڿ���
    String    quota           = "";                                                       // �Һΰ���
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   02. �ν��Ͻ� ���� �� �ʱ�ȭ                                              = */
    /* = -------------------------------------------------------------------------- = */
    J_PP_CLI_N c_PayPlus = new J_PP_CLI_N();

    c_PayPlus.mf_init( g_conf_log_dir, g_conf_gw_url, g_conf_gw_port, g_conf_tx_mode, "" );
    c_PayPlus.mf_init_set();
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   03. ó�� ��û ���� ����, ����                                            = */
    /* = -------------------------------------------------------------------------- = */

    /* = -------------------------------------------------------------------------- = */
    /* =   03-1. ���� ��û                                                          = */
    /* = -------------------------------------------------------------------------- = */
        // ��ü ȯ�� ����
        String cust_ip = request.getRemoteAddr(); // ��û IP (�ɼǰ�)

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

            // �ֹ� ����
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

                c_PayPlus.mf_set_us( card_data_set, "card_mny", good_mny );        // ���� �ݾ�

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
    /* =   03-2. ���/���� ��û                                                     = */
    /* = -------------------------------------------------------------------------- = */
        else if ( req_tx.equals( "mod" ) )
        {
            int     mod_data_set_no;

            tran_cd = "00200000";
            mod_data_set_no = c_PayPlus.mf_add_set( "mod_data" );

            c_PayPlus.mf_set_us( mod_data_set_no, "tno",        request.getParameter( "tno"       ) );      // KCP ���ŷ� �ŷ���ȣ
            c_PayPlus.mf_set_us( mod_data_set_no, "mod_type",   mod_type                            );      // ���ŷ� ���� ��û ����
            c_PayPlus.mf_set_us( mod_data_set_no, "mod_ip",     cust_ip                             );      // ���� ��û�� IP
            c_PayPlus.mf_set_us( mod_data_set_no, "mod_desc",   request.getParameter( "mod_desc"  ) );      // ���� ����

            if ( mod_type.equals( "STPC" ) ) // �κ������ ���
            {
                c_PayPlus.mf_set_us( mod_data_set_no, "mod_mny", request.getParameter( "mod_mny" ) ); // ��ҿ�û�ݾ�
                c_PayPlus.mf_set_us( mod_data_set_no, "rem_mny", request.getParameter( "rem_mny" ) ); // ��Ұ����ܾ�
            }
        }
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   03-3. ����                                                               = */
    /* ------------------------------------------------------------------------------ */
        if ( tran_cd.length() > 0 )
        {
            c_PayPlus.mf_do_tx( g_conf_site_cd, g_conf_site_key, tran_cd, cust_ip, ordr_idxx, "3", "0" );
        }
        else
        {
            c_PayPlus.m_res_cd  = "9562";
            c_PayPlus.m_res_msg = "���� ����";
        }
        res_cd  = c_PayPlus.m_res_cd;                      // ��� �ڵ�
        res_msg = c_PayPlus.m_res_msg;                     // ��� �޽���
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   04. ���� ��� ó��                                                       = */
    /* = -------------------------------------------------------------------------- = */
        if ( req_tx.equals( "pay" ) )
        {
            if ( res_cd.equals( "0000" ) )
            {
                tno = c_PayPlus.mf_get_res( "tno" );       // KCP �ŷ� ���� ��ȣ

    /* = -------------------------------------------------------------------------- = */
    /* =   04-1. �ſ�ī�� ���� ��� ó��                                            = */
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
    /* =   04-2. ���� ����� ��ü ��ü������ DB ó�� �۾��Ͻô� �κ��Դϴ�.         = */
    /* = -------------------------------------------------------------------------- = */
    /* =         ���� ����� DB �۾� �ϴ� �������� ���������� ���ε� �ǿ� ����      = */
    /* =         DB �۾��� �����Ͽ� DB update �� �Ϸ���� ���� ���, �ڵ�����       = */
    /* =         ���� ��� ��û�� �ϴ� ���μ����� �����Ǿ� �ֽ��ϴ�.                = */
    /* =         DB �۾��� ���� �� ���, bSucc ��� ����(String)�� ���� "false"     = */
    /* =         �� ������ �ֽñ� �ٶ��ϴ�. (DB �۾� ������ ��쿡�� "false" �̿��� = */
    /* =         ���� �����Ͻø� �˴ϴ�.)                                           = */
    /* = -------------------------------------------------------------------------- = */
                bSucc = "";             // DB �۾� ������ ��� "false" �� ����

    /* = -------------------------------------------------------------------------- = */
    /* =   04-3. DB �۾� ������ ��� �ڵ� ���� ���                                 = */
    /* = -------------------------------------------------------------------------- = */
                if ( bSucc.equals("false") )
                {
                    int mod_data_set_no;

                    c_PayPlus.mf_init_set();

                    tran_cd = "00200000";

                    mod_data_set_no = c_PayPlus.mf_add_set( "mod_data" );

                    c_PayPlus.mf_set_us( mod_data_set_no, "tno",      tno    );                         // KCP ���ŷ� �ŷ���ȣ
                    c_PayPlus.mf_set_us( mod_data_set_no, "mod_type", "STSC" );                         // ���ŷ� ���� ��û ����
                    c_PayPlus.mf_set_us( mod_data_set_no, "mod_ip",   cust_ip );                        // ���� ��û�� IP (�ɼǰ�)
                    c_PayPlus.mf_set_us( mod_data_set_no, "mod_desc", "������ ��� ó�� ���� - ���������� �ڵ� ��� ��û" );   // ���� ����
                    c_PayPlus.mf_do_tx( g_conf_site_cd, g_conf_site_key, tran_cd, cust_ip, ordr_idxx, "3", "0" );

                    res_cd  = c_PayPlus.m_res_cd;
                    res_msg = c_PayPlus.m_res_msg;
                }

            }    // End of [res_cd = "0000"]

    /* = -------------------------------------------------------------------------- = */
    /* =   04-4. ���� ���и� ��ü ��ü������ DB ó�� �۾��Ͻô� �κ��Դϴ�.         = */
    /* = -------------------------------------------------------------------------- = */
            else
            {
            }
        }
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   05. ���/���� ��� ó��                                                  = */
    /* = -------------------------------------------------------------------------- = */
        else if ( req_tx.equals( "mod" ) )
        {
            if ( res_cd.equals( "0000" ) )
            {
                if ( mod_type.equals ( "STPC") )
                {
                amount       = c_PayPlus.mf_get_res( "amount"       ); // �� �ݾ�
                panc_mod_mny = c_PayPlus.mf_get_res( "panc_mod_mny" ); // �κ���� ��û�ݾ�
                panc_rem_mny = c_PayPlus.mf_get_res( "panc_rem_mny" ); // �κ���� ���ɱݾ�
                }
            }
        }
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   06. �� ���� �� ��������� ȣ��                                           = */
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
        <form name="pay_info" method="post" action="./result.jsp">
            <input type="hidden" name="req_tx"     value="<%= req_tx     %>">  <!-- ��û ���� -->
            <input type="hidden" name="pay_method" value="<%= pay_method %>">  <!-- ����� ���� ���� -->
            <input type="hidden" name="bSucc"      value="<%= bSucc      %>">  <!-- ���θ� DB ó�� ���� ���� -->
            <input type="hidden" name="mod_type"   value="<%= mod_type   %>">
            <input type="hidden" name="amount"     value="<%= amount     %>">  <!-- �� �ݾ� -->
            <input type="hidden" name="panc_mod_mny"   value="<%=panc_mod_mny%>">  <!-- �κ���� ��û�ݾ� -->
            <input type="hidden" name="panc_rem_mny"   value="<%=panc_rem_mny%>">  <!-- �κ���� ���ɱݾ� -->

            <input type="hidden" name="res_cd"     value="<%= res_cd     %>">  <!-- ��� �ڵ� -->
            <input type="hidden" name="res_msg"    value="<%= res_msg    %>">  <!-- ��� �޼��� -->
            <input type="hidden" name="ordr_idxx"  value="<%= ordr_idxx  %>">  <!-- �ֹ���ȣ -->
            <input type="hidden" name="tno"        value="<%= tno        %>">  <!-- KCP �ŷ���ȣ -->
            <input type="hidden" name="good_mny"   value="<%= good_mny   %>">  <!-- �����ݾ� -->
            <input type="hidden" name="good_name"  value="<%= good_name  %>">  <!-- ��ǰ�� -->
            <input type="hidden" name="buyr_name"  value="<%= buyr_name  %>">  <!-- �ֹ��ڸ� -->
            <input type="hidden" name="buyr_tel1"  value="<%= buyr_tel1  %>">  <!-- �ֹ��� ��ȭ��ȣ -->
            <input type="hidden" name="buyr_tel2"  value="<%= buyr_tel2  %>">  <!-- �ֹ��� �޴�����ȣ -->
            <input type="hidden" name="buyr_mail"  value="<%= buyr_mail  %>">  <!-- �ֹ��� E-mail -->

            <input type="hidden" name="card_cd"    value="<%= card_cd    %>">  <!-- ī���ڵ� -->
            <input type="hidden" name="card_no"    value="<%= card_no    %>">  <!-- ī���ȣ -->
            <input type="hidden" name="card_name"  value="<%= card_name  %>">  <!-- ī��� -->
            <input type="hidden" name="app_time"   value="<%= app_time   %>">  <!-- ���νð� -->
            <input type="hidden" name="app_no"     value="<%= app_no     %>">  <!-- ���ι�ȣ -->
            <input type="hidden" name="quota"      value="<%= quota      %>">  <!-- �Һΰ��� -->
            <input type="hidden" name="noinf"      value="<%= noinf      %>">  <!-- �����ڿ��� -->

        </form>
    </body>
    </html>
