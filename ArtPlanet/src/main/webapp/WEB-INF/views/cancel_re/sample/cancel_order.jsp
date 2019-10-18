<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding ("utf-8");

    /* ============================================================================== */
    /* =   PAGE : 취소모듈 PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2013   KCP Inc.   All Rights Reserved.                    = */
    /* ============================================================================== */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <title>*** KCP Online Payment System Ver 7.0[HUB Version] ***</title>
    <meta http-equiv="X-UA-Compatible" content="text/html;charset=utf-8">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
	function  jsf__go_mod( form )
    {
        if ( form.tno.value.length < 14 )
        {
            alert( "KCP 거래 번호 14자리를 입력하세요" );
            form.tno.focus();
            form.tno.select();
            return false;
        }
		  else
        {
            return true;
        }
	}
	function  sub_cancel_chk( val )
    {
        if( val == "STPC")
        {
            show_sub_cancel.style.display = "block";
        }
        else
        {
            show_sub_cancel.style.display = "none";
        }
    }
	    </script>
</head>
<body oncontextmenu="return false;" ondragstart="return false;" onselectstart="return false;">

    <div id="sample_wrap">

    <form name="acnt_form" action="Cancel.do" method="post" >
        
      <!-- 타이틀 Start -->
        <h1>[결과출력] <span>이 페이지는 결제 결과를 출력하는 샘플(예시) 페이지입니다.</span></h1>
      <!-- 타이틀 End -->
      <div class="sample">
      <!--상단 테이블 Start-->
      <p>
      결제 결과를 출력하는 페이지입니다.<br />
      요청이 정상적으로 처리된 경우 결과코드(res_cd)값이 0000으로 표시됩니다.
      </p>

	  <h2>&sdot; 취소정보</h2>
        <table class="tbl" cellpadding="0" cellspacing="0">
		<tr>
                <th>거래번호</th>
                <td><input type="text" name="tno" value=""  class="frminput" size="20" maxlength="14"/></td>
            </tr>
            <!-- 변경유형 -->
            <tr>
                <th>변경 유형</th>
                <td>
                    <select name="mod_type" class="frmselect" onChange="sub_cancel_chk(this.value);"/>
                        <option value="STSC">전체 취소요청</option>
                        <option value="STPC">부분 취소요청</option>
                    </select>
                </td>
            </tr>
            <!-- 변경사유 -->
            <tr>
                <th>변경사유</th>
                <td><input type="text" name="mod_desc" value=""  class="frminput" size="40" maxlength="100"/></td>
            </tr>
        </table>
		<table id="show_sub_cancel" style="display:none" class="tbl" cellpadding="0" cellspacing="0">
            <!-- 요청 구분 : 개별승인 환불요청 정보 -->
            <tr>
                <th>요청 구분</th>
                <td>부분 취소요청</td>
            </tr>
            <!-- Input : 부분환불 요청 금액 입력 -->
            <tr>
                <th>부분취소 요청 금액</th>
                <td><input type="text" name="mod_mny" value=""  class="frminput" size="20" maxlength="10"/></td>
            </tr>
            <!-- Input : 부분환불 전 남은 금액(rem_mny) 입력 -->
            <tr>
                <th>부분취소 전 남은 금액</th>
                <td><input type="text" name="rem_mny" value="" class="frminput" size="20" maxlength="10"/></td>
            </tr>
			
			            <tr>
                <th>과세금액</th>
                <td><input type="text" name="mod_tax_mny" value="" class="frminput" size="20" maxlength="10"/></td>
            </tr>
			
			            <tr>
                <th>부과세 금액</th>
                <td><input type="text" name="mod_vat_mny" value="" class="frminput" size="20" maxlength="10"/></td>
            </tr>
			
			            <tr>
                <th>비과세 금액</th>
                <td><input type="text" name="mod_free_mny" value="" class="frminput" size="20" maxlength="10"/></td>
            </tr>
			
			
        </table>
		<!-- 결제 버튼 테이블 Start -->
        <div class="btnset">
            <table align="center" cellspacing="0" cellpadding="0" class="margin_top_20"> 
                <tr id="show_pay_btn">
                    <td colspan="2" align="center">
                        <input name="" type="submit" class="submit" value="취소요청" onclick="return jsf__go_mod(this.form);"/>
                        <a href="./../index.html" class="home">처음으로</a>
        </div>
                    </td>
                </tr>
        <!-- 결제 진행 중입니다. 메시지 -->
                <tr id="show_progress" style="display:none">
                    <td colspan="2" class="center red" >취소 진행 중입니다. 잠시만 기다려 주십시오...</td>
                </tr>
            </table>
        </div>
        <!-- 결제 버튼 테이블 End -->
    </div>
            <!-- 결제 버튼 테이블 End -->
          <div class="footer">
            Copyright (c) KCP INC. All Rights reserved.
          </div>
    <input type="hidden" name = "req_tx"       value="mod"/>
    </form>
    </div>
</body>
</html>