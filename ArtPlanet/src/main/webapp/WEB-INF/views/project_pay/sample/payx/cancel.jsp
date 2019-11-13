<%@ page contentType="text/html;charset=euc-kr" %>
<%
    /* ============================================================================== */
    /* =   PAGE : ��� ��û PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2013   KCP Inc.   All Rights Reserverd.                   = */
    /* ============================================================================== */

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>*** KCP Online Payment System ***</title>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
    <link href="css/style.css" rel="stylesheet" type="text/css"/>

        <script type="text/javascript">
        /* ��� ��ư�� ������ �� ȣ�� */
    function  jsf__go_cancel( form )
    {
        var RetVal = false ;
        if ( form.mod_type.value != 'mod_type_not_sel' )
        {
            if ( form.tno.value.length < 14 )
            {
                alert( "KCP �ŷ� ��ȣ�� �Է��ϼ���" );
                form.tno.focus();
                form.tno.select();
            }
            else
            {
                RetVal = true ;
            }
        }
        else
        {
            alert( "�ŷ� ������ �����Ͽ� �ֽʽÿ�." );
            form.mod_type.focus();
        }
            return RetVal ;
    }
    </script>

    <body>

    <div id="sample_wrap">
<%
    /* ============================================================================== */
    /* =    1. ��� ��û ���� �Է� ��(cancel_info)                                  = */
    /* = -------------------------------------------------------------------------- = */
    /* =   ��� ��û�� �ʿ��� ������ �����մϴ�.                                    = */
    /* = -------------------------------------------------------------------------- = */
%>
    <form name="cancel_info" method="post" action="pp_cli_hub.jsp">

                 <!-- Ÿ��Ʋ Start-->
                    <h1>[��ҿ�û] <span>�� �������� �����ǿ� ���� ��Ҹ� ��û�ϴ� ����(����) �������Դϴ�.</span></h1>
                 <!-- Ÿ��Ʋ End -->

                    <!-- ��� ���̺� Start -->
                    <div class="sample">
                    <p>
                        �ҽ� ���� �� �ҽ� �ȿ� <span>�� ���� ��</span> ǥ�ð� ���Ե� ������ �������� ��Ȳ�� �°� ������ ���� <br/>
                        �����Ͻñ� �ٶ��ϴ�.<br/>
                        <span>�� �������� ������ �ǿ� ���� ��Ҹ� ��û�ϴ� ������ �Դϴ�.</span><br/>
                        ������ ���εǸ� ��������� KCP �ŷ���ȣ(tno)���� ������ �� �ֽ��ϴ�.<br/>
                        ������������ KCP �ŷ���ȣ(tno)������ ��ҿ�û�� �Ͻ� �� �ֽ��ϴ�.
                    </p>
                    <!-- ��� ���̺� End -->
                <!-- ��� ��û ���� �Է� ���̺� Start -->
                    <h2>&sdot; ��� ��û</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                    <!-- ��û ���� : ��� -->
                    <tr>
                        <th>��û ����</th>
                        <td>
                            <select name='mod_type' onChange="jsf__chk_mod_type()">
                                <option value='mod_type_not_sel' selected>�����Ͻʽÿ�</option>
                                <option value='STSC'>���</option>
                                <option value='STPC'>�κ����</option>
                            </select>
                        </td>
                    </tr>
                    <!-- Input : ������ ���� �ŷ���ȣ(14 byte) �Է� -->
                    <tr>
                        <th>KCP �ŷ���ȣ</th>
                        <td><input type="text" name="tno" value=""  class="w200" maxlength="14"/></td>
                    </tr>
                     <!-- Input : ���� ����(mod_desc) �Է� -->
                    <tr>
                        <th>���� ����</th>
                        <td><input type="text" name="mod_desc" value="" class="w200" maxlength="50"/></td>
                    </tr>
                     <!-- Input : ��� ��û �ݾ�(mod_mny) �Է� -->
                    <tr>
                        <th>��� ��û �ݾ�<br/>(�κ���ҽ� ���)</th>
                        <td>
                            <input type='text' name='mod_mny' value='' class="w200" size='20' maxlength='14'>
                        </td>
                    </tr>
                     <!-- Input : ��� ���� �ݾ�(rem_mny) �Է� -->
                    <tr>
                        <th>��� ���� �ܾ�<br/>(�κ���ҽ� ���)</th>
                        <td>
                            <input type='text' name='rem_mny' value='' class="w200" size='20' maxlength='14'>
                        </td>
                    </tr>
                    </table>

                <!-- ��� ��û ���� �Է� ���̺� End -->

                    <!-- ���� ��ư ���̺� Start -->
                    <div class="btnset">
                    <input name="" type="submit" class="submit" value="��ҿ�û" onclick="return jsf__go_cancel(this.form);"/>
                    <a href="../index.html" class="home">ó������</a>
                    </div>
                    <!-- ���� ��ư ���̺� End -->
                </div>
            <div class="footer">
                Copyright (c) KCP INC. All Rights reserved.
            </div>

<%
    /* ============================================================================== */
    /* =   1. ��� ��û �ʼ� ���� ����                                              = */
    /* = -------------------------------------------------------------------------- = */
    /* =   �� ���� �� - �ݵ�� �ʿ��� �����Դϴ�.                                   = */
    /* = -------------------------------------------------------------------------- = */
%>
        <input type="hidden" name="req_tx"       value="mod"  />
<%
    /* = -------------------------------------------------------------------------- = */
    /* =   1. ��� ��û �ʼ� ���� ���� End                                          = */
    /* ============================================================================== */
%>
    </form>
</div>
</body>
</html>
