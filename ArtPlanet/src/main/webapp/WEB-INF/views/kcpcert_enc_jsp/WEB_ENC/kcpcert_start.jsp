<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="kr.co.kcp.CT_CLI"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ include file="../cfg/cert_conf.jsp"%>
<%
	String site_cd = "S6186"; //사이트 코드
	String ordr_idxx = "TEST" + (new SimpleDateFormat("yyyyMMddHHmmssSSSSSSS").format(new Date())); // 요청번호 생성 예제

	System.out.println("인증 start page입니다");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Certification(미완성)</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
<meta name="description"
	content="Kero HTML Bootstrap 4 Dashboard Template">

<!-- Disable tap highlight on IE -->
<meta name="msapplication-tap-highlight" content="no">
<script type="text/javascript"
	src="<c:url value='/resources/js/CertificationByPhone.js'/>"></script>
<link
	href="<c:url value='/resources/kero/main.07a59de7b920cd76b874.css'/>"
	rel="stylesheet">
<style>
#kcpcert_start_Body {
	background-image:
		url("<c:url value='/resources/img/background/fncbackground.png'/>");
	no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.modal-content {
	background-color: #f0efef;
}

#kcpcert_start_modal {
	margin-bottom: 300px;
}

#kcpcert_start_logo {
	margin-top: 200px;
}
</style>
</head>


<div class="app-container app-theme-white body-tabs-shadow"
	id="kcpcert_start_Body">
	<div class="app-container">
		<div class="container">
			<div class="h-100 bg-premium-white">
				<div class="d-flex h-100 justify-content-center align-items-center">
					<div class="mx-auto app-login-box">
						<div id="kcpcert_start_logo">
							<img src="<c:url value='/resources/img/logo.png'/>" alt="로고이미지" />
						</div>
						<div class="modal-dialog w-100" id="kcpcert_start_modal">
							<div class="modal-content">
								<div class="modal-body">
									<h5 class="modal-title">
										<div style="text-align: center; margin-bottom: 30px;">인증이
											필요합니다</div>
									</h5>
									<!-- 입력 폼 시작 -->
									<form name="form_auth" method="post">

										<!-- 스프링 시큐리티 사용시 모든 POST 요청에 반드시 넣어줘야함  -->
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />

										<!-- 인증요청 정보 출력 테이블 - 인증요청 버튼만 보이게 visibility: collapse 적용 -->
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
													name="sex_code" value="" />선택 <input type="radio"
													name="sex_code" value="01" />남성 <input type="radio"
													name="sex_code" value="02" />여성 <!-- 내/외국인구분 --> <select
													name='local_code' class="frmselect">
														<option value=''>선택</option>
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
										<table align="center" cellspacing="0" cellpadding="0"
											class="margin_top_20">
											<!-- 인증요청 이미지 버튼 -->
											<tr id="show_pay_btn">
												<td colspan="2" align="center"><input type="submit"
													formaction="https://testcert.kcp.co.kr/kcp_cert/cert_view.jsp"
													class="mb-2 mr-2 btn btn-primary btn-sm"
													onclick="return auth_type_check();" value="휴대폰 인증" /></td>
											</tr>
										</table>
										<!-- 인증요청 버튼 테이블 End -->

										<!-- ***************** <히든으로 넘겨주는 input 태그들>  *************************** -->

										<!-- 요청종류 -->
										<input type="hidden" name="req_tx" value="cert" />
										<!-- 요청구분 -->
										<input type="hidden" name="cert_method" value="01" />
										<!-- 웹사이트아이디 : ../cfg/cert_conf.jsp 파일에서 설정해주세요 -->
										<input type="hidden" name="web_siteid"
											value="<%=g_conf_web_siteid%>" />
										<!-- 노출 통신사 default 처리시 아래의 주석을 해제하고 사용하십시요 
									               SKT : SKT , KT : KTF , LGU+ : LGT
									          <input type="hidden" name="fix_commid"      value="KTF"/>
									          -->
										<!-- 사이트코드 : ../cfg/cert_conf.jsp 파일에서 설정해주세요 -->
										<input type="hidden" name="site_cd"
											value="<%=g_conf_site_cd%>" />
										<!-- Ret_URL : ../cfg/cert_conf.jsp 파일에서 설정해주세요 -->
										<input type="hidden" name="Ret_URL"
											value="<%=g_conf_Ret_URL%>" />
										<!-- cert_otp_use 필수 ( 메뉴얼 참고)
									               Y : 실명 확인 + OTP 점유 확인 , N : 실명 확인 only
									          -->
										<input type="hidden" name="cert_otp_use" value="Y" />
										<!-- cert_enc_use 필수 (고정값 : 메뉴얼 참고) -->
										<input type="hidden" name="cert_enc_use" value="Y" />
										<!-- 리턴 암호화 고도화 -->
										<input type="hidden" name="cert_enc_use_ext" value="Y" /> <input
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
										<!-- ************************************************************************* -->
									</form>
									<!-- 입력 폼 끝 -->
								</div>

								<!-- <div class="divider row"></div> -->

							</div>
						</div>
						<div class="text-center text-dark opacity-8 mt-3">Copyright
							© ArtPlanet</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
</div>