<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="kr.co.kcp.CT_CLI"%>
<%
	String site_cd   = "S6186"; //사이트 코드
	String ordr_idxx = "TEST" + (new SimpleDateFormat("yyyyMMddHHmmssSSSSSSS")
			.format(new Date())); // 요청번호 생성 예제
%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Certification(미완성)</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
    />
    <meta name="description" content="Kero HTML Bootstrap 4 Dashboard Template">
	
    <!-- Disable tap highlight on IE -->
    <meta name="msapplication-tap-highlight" content="no">
	<script type="text/javascript" src="<c:url value='/resources/js/CertificationByPhone.js'/>"></script>
	<link href="<c:url value='/resources/kero/main.07a59de7b920cd76b874.css'/>" rel="stylesheet"></head>

<body>
    <div class="app-container app-theme-white body-tabs-shadow">
            <div class="app-container">
                <div class="h-100 bg-premium-white">
                    <div class="d-flex h-100 justify-content-center align-items-center">
                        <div class="mx-auto app-login-box col-md-8">
                            <div class="col-md-6 mx-auto" >
                            	<img src="<c:url value='/resources/img/logo.png'/>"  alt="로고이미지"/>
                            </div>
                            <div class="modal-dialog w-100">
                                <div class="modal-content">
								<div class="modal-body">
									<h5 class="modal-title">
										<h4 class="mt-2">
											<div style="text-align: center;">인증 방식</div>
									</h5>
									<div class="divider row"></div>
									<!-- 휴대폰 인증 시작 -->
									<div >
										<form name="form_auth">
											<!-- 인증요청 정보 출력 테이블 Start -->
											<table style="visibility: collapse;" width="527"
												align="center" cellspacing="0" cellpadding="0"
												class="margin_top_20">
												<tr>
													<td colspan="2" class="title">인 증 정 보</td>
												</tr>
												<!-- 요청번호(ordr_idxx) -->
												<tr>
													<td class="sub_title1">요청번호</td>
													<td class="sub_input1">&nbsp&nbsp<input type="text"
														name="ordr_idxx" class="frminput" value="<%=ordr_idxx%>"
														size="40" readonly="readonly" maxlength="40" /></td>
												</tr>
												<!-- 명의자명 -->
												<tr>
													<td class="sub_title1">성명</td>
													<td class="sub_content1"><input type="text"
														name="user_name" value="" size="20" maxlength="20"
														class="frminput" /></td>
												</tr>
												<!-- 생년월일 -->
												<tr>
													<td class="sub_title1">생년월일</td>
													<td class="sub_content1" id="year_month_day"></td>
												</tr>
												<!-- 성별구분 -->
												<tr>
													<td class="sub_title1">성별구분</td>
													<td class="sub_content1 bold"><input type="radio"
														name="sex_code" value="01" />남성 <input type="radio"
														name="sex_code" value="02" />여성 <!-- 내/외국인구분 --> <select
														name='local_code' class="frmselect">
															<option value='01'>내국인</option>
															<option value='02'>외국인</option>
													</select></td>
												</tr>

												<tr class="height_1px">
													<td colspan="2" bgcolor="#0f75ac"></td>
												</tr>
											</table>
											<!-- 인증요청 정보 출력 테이블 End -->

											<!-- 인증요청 버튼 테이블 Start -->
											<table align="center" cellspacing="0"
												cellpadding="0" class="margin_top_20">
												<!-- 인증요청 이미지 버튼 -->
												<tr id="show_pay_btn">
													<td colspan="2" align="center">
													<input type="submit"
														formaction="<c:url value='/resources/kcpcert_enc/WEB_ENC/kcpcert_proc_req.jsp'/>"
														class="mb-2 mr-2 btn btn-primary btn-sm"
														onclick="return auth_type_check();" 
														value="휴대폰으로 인증하겠습니다" /></td>
												</tr>
											</table>
											<!-- 인증요청 버튼 테이블 End -->

											<!-- 요청종류 -->
											<input type="hidden" name="req_tx" value="cert" />
											<!-- 요청구분 -->
											<input type="hidden" name="cert_method" value="01" />
											<!-- 웹사이트아이디 -->
											<input type="hidden" name="web_siteid" value="" />
											<!-- 노출 통신사 default 처리시 아래의 주석을 해제하고 사용하십시요 
                    							SKT통신사 : SKT , KT통신사 : KTF , LGU+통신사 : LGT
              									 -->
											<input type="hidden" name="fix_commid" value="KTF" />
											<!-- 사이트코드 -->
											<input type="hidden" name="site_cd" value="<%= site_cd %>" />
											<!-- Ret_URL : 인증결과 리턴 페이지 ( 가맹점 URL 로 설정해 주셔야 합니다. ) -->
											<input type="hidden" name="Ret_URL"
												value="<c:url value='/resources/kcpcert_enc/WEB_ENC/kcpcert_proc_req.jsp'/>" />

											<!-- https://testcert.kcp.co.kr/kcp_cert/cert_view.jsp -->
											<%-- <c:url value='/resources/kcpcert_enc/WEB_ENC/kcpcert_proc_req.jsp'/> --%>
											<!-- value="http://192.168.0.47:8080/kcpcert_enc/WEB_ENC/kcpcert_proc_req.jsp" -->

											<!-- cert_otp_use 필수 ( 메뉴얼 참고)
      															 Y : 실명 확인 + OTP 점유 확인 , N : 실명 확인 only
              																							  -->
											<input type="hidden" name="cert_otp_use" value="Y" />
											<!-- cert_enc_use 필수 (고정값 : 메뉴얼 참고) -->
											<input type="hidden" name="cert_enc_use" value="N" /> <input
												type="hidden" name="res_cd" value="" /> <input type="hidden"
												name="res_msg" value="" />

											<!-- up_hash 검증 을 위한 필드 -->
											<input type="hidden" name="veri_up_hash" value="" />

											<!-- 본인확인 input 비활성화 -->
											<input type="hidden" name="cert_able_yn" value="" />

											<!-- web_siteid 검증 을 위한 필드 -->
											<input type="hidden" name="web_siteid_hashYN" value="" />

											<!-- 가맹점 사용 필드 (인증완료시 리턴)-->
											<input type="hidden" name="param_opt_1" value="opt1" /> <input
												type="hidden" name="param_opt_2" value="opt2" /> <input
												type="hidden" name="param_opt_3" value="opt3" />
										</form>
									</div>
									<!-- 휴대폰 인증 끝 -->
									<div class="divider row"></div>
									<div align="center">
									<!-- 이메일 인증 시작  -->
									<input type="submit"
														class="mb-2 mr-2 btn btn-primary btn-sm"
														value="이메일로 인증하겠습니다." />
									</div>
									<!-- 이메일 인증 끝  -->
								</div>
							</div>
                            <div class="text-center text-dark opacity-8 mt-3">Copyright © ArtPlanet</div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
<script type="text/javascript" src="<c:url value='/resources/kero/assets/scripts/main.07a59de7b920cd76b874.js'/>" ></script>
</body>
</html>
    