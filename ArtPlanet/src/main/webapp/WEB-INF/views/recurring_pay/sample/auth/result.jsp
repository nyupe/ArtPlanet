<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%
    /* ============================================================================== */
    /* =   PAGE : ��� ó�� PAGE                                                    = */
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
    /* ============================================================================== */
    /* =   01. ���� ���                                                            = */
    /* = -------------------------------------------------------------------------- = */
    String res_cd      = f_get_parm( request.getParameter( "res_cd"      ) ); // ��� �ڵ�
    String res_msg     = f_get_parm( request.getParameter( "res_msg"     ) ); // ��� �޽���
    /* = -------------------------------------------------------------------------- = */
    String ordr_idxx   = f_get_parm( request.getParameter( "ordr_idxx"   ) ); // �ֹ���ȣ
    String buyr_name   = f_get_parm( request.getParameter( "buyr_name"   ) ); // ��û�� �̸�
    String card_cd     = f_get_parm( request.getParameter( "card_cd"     ) ); // ī�� �ڵ�
    String batch_key   = f_get_parm( request.getParameter( "batch_key"   ) ); // ��ġ ����Ű
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   02. ��������� �� ����                                                   = */
    /* ============================================================================== */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http:'www.w3.org/1999/xhtml" >

<head>
    <title>*** KCP Payment System ***</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
    <link href="css/style.css" rel="stylesheet" type="text/css" id="cssLink"/>
</head>

<body>
    <div id="sample_wrap">
    <form name="mod" method="post">
        <h1>[������]<span> �� �������� ���� ����� ����ϴ� ����(����) �������Դϴ�.</span></h1>
    <div class="sample">
        <p>
          ��û ����� ����ϴ� ������ �Դϴ�.<br />
          ��û�� ���������� ó���� ��� ����ڵ�(res_cd)���� 0000���� ǥ�õ˴ϴ�.
        </p>
<%
    /* ============================================================================== */
    /* =   ���� ��� �ڵ� �� �޽��� ���(����������� �ݵ�� ������ֽñ� �ٶ��ϴ�.)= */
    /* = -------------------------------------------------------------------------- = */
    /* =   ���� ���� : res_cd���� 0000���� �����˴ϴ�.                              = */
    /* =   ���� ���� : res_cd���� 0000�̿��� ������ �����˴ϴ�.                     = */
    /* = -------------------------------------------------------------------------- = */
%>
                    <h2>&sdot; ó�� ���</h2>
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
                    </table>
<%
            /* ============================================================================== */
            /* =   1. ���� ������ ���� ��� ��� ( res_cd���� 0000�� ���)                  = */
            /* = -------------------------------------------------------------------------- = */
            if ( res_cd.equals("0000") )
            {
%>

                    <h2>&sdot; �ֹ� ����</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                    <!-- �ֹ���ȣ -->
                    <tr>
                        <th>�ֹ���ȣ</th>
                        <td><%=ordr_idxx%></td>
                    </tr>
                    <!-- �ֹ��ڸ� -->
                    <tr>
                        <th>�ֹ��ڸ�</th>
                        <td><%=buyr_name%></td>
                    </tr>
                    </table>

                    <h2>&sdot; ���� ���� ����</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                    <!-- ���� ī�� -->
                    <tr>
                        <th>����ī���ڵ�</th>
                        <td><%=card_cd%></td>
                    </tr>
                    <!-- ���νð� -->
                    <tr>
                        <th>��ġŰ</th>
                        <td><%=batch_key%></td>
                    </tr>
                    </table>
<%
    }
%>
                    <!-- ó������ �̹��� ��ư -->
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
