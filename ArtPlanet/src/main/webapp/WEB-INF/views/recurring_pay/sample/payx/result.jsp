<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
    /* ============================================================================== */
    /* =   PAGE : ���� ��� ��� PAGE                                               = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ���� ��û ������� ����ϴ� �������Դϴ�.                                = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ������ ������ �߻��ϴ� ��� �Ʒ��� �ּҷ� �����ϼż� Ȯ���Ͻñ� �ٶ��ϴ�.= */
    /* =   ���� �ּ� : http://kcp.co.kr/technique.requestcode.do                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2013   KCP Inc.   All Rights Reserverd.                   = */
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
    request.setCharacterEncoding ( "euc-kr" ) ;
    /* ============================================================================== */
    /* =   ���� ���                                                                = */
    /* = -------------------------------------------------------------------------- = */
    String req_tx           = f_get_parm( request.getParameter( "req_tx"         ) );      // ��û ����(����/���)
    String pay_method       = f_get_parm( request.getParameter( "pay_method"     ) );      // ��� ���� ����
    String bSucc            = f_get_parm( request.getParameter( "bSucc"          ) );      // ��ü DB ����ó�� �Ϸ� ����
    /* = -------------------------------------------------------------------------- = */
    String res_cd           = f_get_parm( request.getParameter( "res_cd"         ) );      // ��� �ڵ�
    String res_msg          = f_get_parm( request.getParameter( "res_msg"        ) );      // ��� �޽���
    String res_msg_bsucc    = "" ;
    String amount           = f_get_parm( request.getParameter( "amount"         ) );      // �ѱݾ�
    String panc_mod_mny     = f_get_parm( request.getParameter( "panc_mod_mny"   ) );      // �κ���� ��û�ݾ�
    String panc_rem_mny     = f_get_parm( request.getParameter( "panc_rem_mny"   ) );      // �κ���� ���ɱݾ�
    String mod_type         = f_get_parm( request.getParameter( "mod_type"       ) );
    /* = -------------------------------------------------------------------------- = */
    String ordr_idxx        = f_get_parm( request.getParameter( "ordr_idxx"      ) );      // �ֹ���ȣ
    String tno              = f_get_parm( request.getParameter( "tno"            ) );      // KCP �ŷ���ȣ
    String good_mny         = f_get_parm( request.getParameter( "good_mny"       ) );      // ���� �ݾ�
    String good_name        = f_get_parm( request.getParameter( "good_name"      ) );      // ��ǰ��
    String buyr_name        = f_get_parm( request.getParameter( "buyr_name"      ) );      // �����ڸ�
    String buyr_tel1        = f_get_parm( request.getParameter( "buyr_tel1"      ) );      // ������ ��ȭ��ȣ
    String buyr_tel2        = f_get_parm( request.getParameter( "buyr_tel2"      ) );      // ������ �޴�����ȣ
    String buyr_mail        = f_get_parm( request.getParameter( "buyr_mail"      ) );      // ������ E-Mail
    /* = -------------------------------------------------------------------------- = */
    // �ſ�ī��
    String card_cd          = f_get_parm( request.getParameter( "card_cd"        ) );      // ī�� �ڵ�
    String card_no          = f_get_parm( request.getParameter( "card_no"        ) );      // ī�� ��ȣ
    String card_name        = f_get_parm( request.getParameter( "card_name"      ) );      // ī���
    String app_time         = f_get_parm( request.getParameter( "app_time"       ) );      // ���νð� (����)
    String app_no           = f_get_parm( request.getParameter( "app_no"         ) );      // ���ι�ȣ
    String quota            = f_get_parm( request.getParameter( "quota"          ) );      // �Һΰ���
    String noinf            = f_get_parm( request.getParameter( "noinf"          ) );      // �����ڿ���
    /* = -------------------------------------------------------------------------- = */

    String req_tx_name = "";

    if     ( req_tx.equals( "pay" ) ) { req_tx_name = "����" ;      }
    else if( req_tx.equals( "mod" ) ) { req_tx_name = "���/����" ; }

    /* ============================================================================== */
    /* =   ������ �� DB ó�� ���н� �� ��� �޽��� ����                           = */
    /* = -------------------------------------------------------------------------- = */

    if ( "pay".equals ( req_tx ) )
    {
        // ��ü DB ó�� ����
        if ( "false".equals ( bSucc ) )
        {
            if ( "0000".equals ( res_cd ) )
                res_msg_bsucc = "������ ���������� �̷�������� ���θ����� ���� ����� ó���ϴ� �� ������ �߻��Ͽ� �ý��ۿ��� �ڵ����� ��� ��û�� �Ͽ����ϴ�. <br> ���θ��� ��ȭ�Ͽ� Ȯ���Ͻñ� �ٶ��ϴ�." ;
            else
                res_msg_bsucc = "������ ���������� �̷�������� ���θ����� ���� ����� ó���ϴ� �� ������ �߻��Ͽ� �ý��ۿ��� �ڵ����� ��� ��û�� �Ͽ�����, <br> <b>��Ұ� ���� �Ǿ����ϴ�.</b><br> ���θ��� ��ȭ�Ͽ� Ȯ���Ͻñ� �ٶ��ϴ�." ;
        }
    }

    /* = -------------------------------------------------------------------------- = */
    /* =   ������ �� DB ó�� ���н� �� ��� �޽��� ���� ��                        = */
    /* ============================================================================== */

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
        // �ſ�ī�� ������ ���� ��ũ��Ʈ
        function receiptView(tno)
        {
            receiptWin = "https://testadmin8.kcp.co.kr/assist/bill.BillAction.do?cmd=card_bill&tno=" + tno ;
             // �ǰ����� "https://admin8.kcp.co.kr/assist/bill.BillAction.do?cmd=card_bill&tno=" ����
            window.open(receiptWin , "" , "width=460, height=820") ;
        }
    </script>
</head>

<body>
    <div id="sample_wrap">

      <!-- Ÿ��Ʋ Start -->
        <h1>[������] <span>�� �������� ���� ����� ����ϴ� ����(����) �������Դϴ�.</span></h1>
      <!-- Ÿ��Ʋ End -->

        <div class="sample">

          <!--��� ���̺� Start-->
            <p>
            ���� ����� ����ϴ� �������Դϴ�.<br />
            ��û�� ���������� ó���� ��� ����ڵ�(res_cd)���� 0000���� ǥ�õ˴ϴ�.
            </p>
          <!--��� ���̺� End-->
<%
    /* ============================================================================== */
    /* =   ���� ��� �ڵ� �� �޽��� ���(����������� �ݵ�� ������ֽñ� �ٶ��ϴ�.)= */
    /* = -------------------------------------------------------------------------- = */
    /* =   ���� ���� : res_cd���� 0000���� �����˴ϴ�.                              = */
    /* =   ���� ���� : res_cd���� 0000�̿��� ������ �����˴ϴ�.                     = */
    /* = -------------------------------------------------------------------------- = */
%>
        <h2>&sdot; ���� ���</h2>
        <table class="tbl" cellpadding="0" cellspacing="0">
            <!-- ��� �ڵ� -->
            <tr>
              <th>��� �ڵ�</th>
              <td><%=res_cd%></td>
            </tr>
                  <!-- ��� �޽��� -->
            <tr>
              <th>��� �޼���</th>
              <td><%=res_msg%></td>
            </tr>
<%
    // ó�� ������(pp_cli_hub.jsp)���� ������ DBó�� �۾��� ������ ��� �󼼸޽����� ����մϴ�.
    if( !"".equals ( res_msg_bsucc ) )
    {
%>
         <tr>
           <th>��� �� �޼���</th>
           <td><%=res_msg_bsucc%></td>
         </tr>
<%
    }
%>
                    </table>
<%
    /* = -------------------------------------------------------------------------- = */
    /* =   ���� ��� �ڵ� �� �޽��� ��� ��                                         = */
    /* ============================================================================== */
%>

<%
    /* ============================================================================== */
    /* =   ���� ��� ���                                                           = */
    /* = -------------------------------------------------------------------------- = */
    if ( "pay".equals ( req_tx ) )
    {
        /* ============================================================================== */
        /* =   ��ü DB ó�� ����(bSucc���� false�� �ƴ� ���)                           = */
        /* = -------------------------------------------------------------------------- = */
        if ( ! "false".equals ( bSucc ) )
        {
            /* ============================================================================== */
            /* =   1. ���� ������ ���� ��� ��� ( res_cd���� 0000�� ���)                  = */
            /* = -------------------------------------------------------------------------- = */
            if ( "0000".equals ( res_cd ) )
            {
%>
                    <h2>&sdot; �ֹ� ����</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                        <!-- �ֹ���ȣ -->
                        <tr>
                          <th>�ֹ� ��ȣ</th>
                          <td><%= ordr_idxx %></td>
                        </tr>
                        <!-- KCP �ŷ���ȣ -->
                        <tr>
                          <th>KCP �ŷ���ȣ</th>
                          <td><%= tno %></td>
                        </tr>
                        <!-- �����ݾ� -->
                        <tr>
                          <th>���� �ݾ�</th>
                          <td><%= good_mny %>��</td>
                        </tr>
                        <!-- ��ǰ��(good_name) -->
                        <tr>
                          <th>�� ǰ ��</th>
                          <td><%= good_name %></td>
                        </tr>
                        <!-- �ֹ��ڸ� -->
                        <tr>
                          <th>�ֹ��ڸ�</th>
                          <td><%= buyr_name %></td>
                        </tr>
                        <!-- �ֹ��� ��ȭ��ȣ -->
                        <tr>
                          <th>�ֹ��� ��ȭ��ȣ</th>
                          <td><%= buyr_tel1 %></td>
                        </tr>
                        <!-- �ֹ��� �޴�����ȣ -->
                        <tr>
                          <th>�ֹ��� �޴�����ȣ</th>
                          <td><%= buyr_tel2 %></td>
                        </tr>
                        <!-- �ֹ��� E-mail -->
                        <tr>
                          <th>�ֹ��� E-mail</th>
                          <td><%= buyr_mail %></td>
                        </tr>
                    </table>
<%
                /* ============================================================================== */
                /* =   1-1. �ſ�ī�� ���� ��� ���                                             = */
                /* = -------------------------------------------------------------------------- = */
                if ( "CARD".equals ( pay_method ) )
                {
%>
                    <h2>&sdot; ī�� ����</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                        <!-- �������� : �ſ�ī�� -->
                        <tr>
                          <th>���� ����</th>
                          <td>�ſ� ī��</td>
                        </tr>
                        <!-- ���� ī�� -->
                        <tr>
                          <th>���� ī��</th>
                          <td><%= card_cd %> / <%= card_name %></td>
                        </tr>
                        <!-- ���νð� -->
                        <tr>
                          <th>���� �ð�</th>
                          <td><%= app_time %></td>
                        </tr>
                        <!-- ���ι�ȣ -->
                        <tr>
                          <th>���� ��ȣ</th>
                          <td><%= app_no %></td>
                        </tr>
                        <!-- �Һΰ��� -->
                        <tr>
                          <th>�Һ� ����</th>
                          <td><%= quota %></td>
                        </tr>
                        <!-- ������ ���� -->
                        <tr>
                          <th>������ ����</th>
                          <td><%= noinf %></td>
                        </tr>
<%
                    /* ============================================================================== */
                    /* =   1-1-2. �ſ�ī�� ������ ���                                              = */
                    /* = -------------------------------------------------------------------------- = */
                    /* =   ���� �ŷ��ǿ� ���ؼ� �������� ����� �� �ֽ��ϴ�.                        = */
                    /* = -------------------------------------------------------------------------- = */
%>
                        <tr>
                          <th>������ Ȯ��</th>
                            <td class="sub_content1"><a href="javascript:receiptView('<%=tno%>')"><img src="./img/btn_receipt.gif" alt="�������� Ȯ���մϴ�." />
                        </td>
                    </table>
<%
                }
            }
        }
    }
            /* = -------------------------------------------------------------------------- = */
            /* =   01-1-3. �κ���ҽ� ��� ��� ���                                        = */
            /* ============================================================================== */
            if( "mod".equals ( req_tx ) )
            {
                if( "STPC".equals ( mod_type ) )
                {
                    if( "0000".equals ( res_cd ) )
                    {
%>
             <h2>&sdot; �κ���� ����</h2>
             <table class="tbl" cellpadding="0" cellspacing="0">
                 <!-- �� �ݾ� -->
                    <tr>
                      <th>�� �ݾ�</th>
                      <td><%= amount %></td>
                    </tr>
                 <!-- �κ���� ��û�ݾ� -->
                     <tr>
                       <th>�κ���� ��û�ݾ�</th>
                       <td><%= panc_mod_mny %></td>
                      </tr>
                 <!-- �κ���� ���ɱݾ� -->
                      <tr>
                        <th>�κ���� ���ɱݾ�</th>
                        <td><%= panc_rem_mny %></td>
                      </tr>
             </table>
<%
                    }
                }
            }
            /* = -------------------------------------------------------------------------- = */
            /* =   1. ���� ������ ���� ��� ��� END                                        = */
            /* ============================================================================== */
%>
                    <!-- ���� ��û/ó������ �̹��� ��ư -->
                <tr>

                <div class="btnset">
                <a href="../index.html" class="home">ó������</a>
                </div>
                </tr>
              </tr>
            </div>
        <div class="footer">
                Copyright (c) KCP INC. All Rights reserved.
        </div>
    </div>
  </body>
</html>