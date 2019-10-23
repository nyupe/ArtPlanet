<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="kr.co.kcp.CT_CLI"%>
<%
	String site_cd   = "S6186"; //����Ʈ �ڵ�
	String ordr_idxx = "TEST" + (new SimpleDateFormat("yyyyMMddHHmmssSSSSSSS")
			.format(new Date())); // ��û��ȣ ���� ����
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>Certification(�ڵ���, �̸��� ����������)</title>
<script type="text/javascript" src="<c:url value='/resources/js/CertificationByPhone.js'/>"></script>
</head>
<body oncontextmenu="return false;" ondragstart="return false;" onselectstart="return false;">
   <div align="center">
           <form name="form_auth">
               <table width="589" cellpadding="0" cellspacing="0">
                   <tr style="height:14px"><td style="background-image:url('../img/boxtop589.gif');"></td></tr>
                   <tr>
                       <td style="background-image:url('../img/boxbg589.gif')">
       
                           <!-- ��� ���̺� Start -->
                           <table width="551px" align="center" cellspacing="0" cellpadding="16">
                               <tr style="height:17px">
                                   <td style="background-image:url('../img/ttbg551.gif');border:0px " class="white">
                                       <span class="bold big">[������û]</span> �� �������� �޴��� ������û �������Դϴ�.
                                   </td>
                               </tr>
                               <tr>
                                   <td style="background-image:url('../img/boxbg551.gif') ;">
                                       <p class="align_left">�ҽ� ���� �� �������� ��Ȳ�� �°� ������ ���� �����Ͻñ� �ٶ��ϴ�.</p>
                                       <p class="align_left">������ �ʿ��� ������ ��Ȯ�ϰ� �Է��Ͻþ� ������ �����Ͻñ� �ٶ��ϴ�.</p>
                                   </td>
                               </tr>
                               <tr style="height:11px"><td style="background:url('../img/boxbtm551.gif') no-repeat;"></td></tr>
                           </table>
                           <!-- ��� ���̺� End -->
       
                           <!-- ������û ���� ��� ���̺� Start -->
                           <table width="527" align="center" cellspacing="0" cellpadding="0" class="margin_top_20">
                               <tr><td colspan="2"  class="title">�� �� �� ��</td></tr>
                               <!-- ��û��ȣ(ordr_idxx) -->
                               <tr>
                                   <td class="sub_title1">��û��ȣ</td>
                                   <td class="sub_input1">&nbsp&nbsp<input type="text" name="ordr_idxx" class="frminput" value="<%=ordr_idxx%>" size="40" readonly="readonly" maxlength="40"/></td>
                               </tr>
                               <!-- �����ڸ� -->
                               <tr>
                                   <td class="sub_title1">����</td>
                                   <td class="sub_content1"><input type="text" name="user_name" value="" size="20" maxlength="20" class="frminput" /></td>
                               </tr>
                               <!-- ������� -->
                               <tr>
                                   <td class="sub_title1">�������</td>
                                   <td class="sub_content1" id="year_month_day">
                                   </td>
                               </tr>
                               <!-- �������� -->
                               <tr>
                                   <td class="sub_title1">��������</td>
                                   <td class="sub_content1 bold">
                                       <input type="radio" name="sex_code" value="01" />����
                                       <input type="radio" name="sex_code" value="02" />����
                                       <!-- ��/�ܱ��α��� -->
                                       <select name='local_code' class="frmselect">
                                           <option value='01'>������</option>
                                           <option value='02'>�ܱ���</option>
                                       </select>
                                   </td>
                               </tr>
       
                               <tr class="height_1px"><td colspan="2" bgcolor="#0f75ac"></td></tr>
                           </table>
                           <!-- ������û ���� ��� ���̺� End -->
       
                           <!-- ������û ��ư ���̺� Start -->
                           <table width="527" align="center" cellspacing="0" cellpadding="0" class="margin_top_20">
                               <!-- ������û �̹��� ��ư -->
                               <tr id="show_pay_btn">
                                   <td colspan="2" align="center">
                                       <input type="image" src="../img/btn_certi.gif" onclick="return auth_type_check();" width="108" height="37" alt="������ ��û�մϴ�" />
                                   </td>
                               </tr>
                           </table>
                           <!-- ������û ��ư ���̺� End -->
                       </td>
                   </tr>
                   <tr><td><img src="../img/boxbtm589.gif" alt="Copyright(c) NHN KCP Inc. All rights reserved."/></td></tr>
               </table>
       
               <!-- ��û���� -->
               <input type="hidden" name="req_tx"       value="cert"/>
               <!-- ��û���� -->
               <input type="hidden" name="cert_method"  value="01"/>
               <!-- ������Ʈ���̵� -->
               <input type="hidden" name="web_siteid"   value=""/> 
               <!-- ���� ��Ż� default ó���� �Ʒ��� �ּ��� �����ϰ� ����Ͻʽÿ� 
                    SKT��Ż� : SKT , KT��Ż� : KTF , LGU+��Ż� : LGT
               -->
               <input type="hidden" name="fix_commid"      value="KTF"/>
               <!-- ����Ʈ�ڵ� -->
               <input type="hidden" name="site_cd"      value="<%= site_cd %>" />
               <!-- Ret_URL : ������� ���� ������ ( ������ URL �� ������ �ּž� �մϴ�. ) -->
               <input type="hidden" name="Ret_URL"      value="<c:url value='/resources/kcpcert_enc/WEB_ENC/kcpcert_proc_req.jsp'/>" />
               
               <!-- https://testcert.kcp.co.kr/kcp_cert/cert_view.jsp -->
               <%-- <c:url value='/resources/kcpcert_enc/WEB_ENC/kcpcert_proc_req.jsp'/> --%>
               <!-- value="http://192.168.0.47:8080/kcpcert_enc/WEB_ENC/kcpcert_proc_req.jsp" -->
               
               <!-- cert_otp_use �ʼ� ( �޴��� ����)
                    Y : �Ǹ� Ȯ�� + OTP ���� Ȯ�� , N : �Ǹ� Ȯ�� only
               -->
               <input type="hidden" name="cert_otp_use" value="Y"/>
               <!-- cert_enc_use �ʼ� (������ : �޴��� ����) -->
               <input type="hidden" name="cert_enc_use" value="N"/>

               <input type="hidden" name="res_cd"       value=""/>
               <input type="hidden" name="res_msg"      value=""/>

               <!-- up_hash ���� �� ���� �ʵ� -->
               <input type="hidden" name="veri_up_hash" value=""/>

               <!-- ����Ȯ�� input ��Ȱ��ȭ -->
               <input type="hidden" name="cert_able_yn" value=""/>

               <!-- web_siteid ���� �� ���� �ʵ� -->
               <input type="hidden" name="web_siteid_hashYN" value=""/>

               <!-- ������ ��� �ʵ� (�����Ϸ�� ����)-->
               <input type="hidden" name="param_opt_1"  value="opt1"/> 
               <input type="hidden" name="param_opt_2"  value="opt2"/> 
               <input type="hidden" name="param_opt_3"  value="opt3"/> 
           </form>
       </div>
</body>
</html>