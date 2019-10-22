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
    <title>Register page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
    />
    <meta name="description" content="Kero HTML Bootstrap 4 Dashboard Template">
	<!-- 핸드폰 인증 로직 JS -->	
	<script type="text/javascript" src="<c:url value='/resources/js/CertificationByPhone.js'/>"></script>
		
    <!-- Disable tap highlight on IE -->
    <meta name="msapplication-tap-highlight" content="no">
		
	<!-- 기존 kero CSS -->
	<link href="<c:url value='/resources/kero/main.07a59de7b920cd76b874.css'/>" rel="stylesheet">
	
	
		
<body>	
   		<div style="margin-top: 200px;" class="app-container app-theme-white body-tabs-shadow">
           	<div class="app-container">
               	<div class="h-100">
                   	<div class="h-100 no-gutters row">
                       	<div class="h-100 d-md-flex d-sm-block bg-white justify-content-center align-items-center col-md-12 ">
                        	<div class="mx-auto app-login-box col-sm-12 col-md-10 col-lg-9">
                        	<div class="form-row">
	                        	<!-- 사진 위치 수정예정  -->
								<div style="margin-bottom: 50px" class="col-md-5 mx-auto"/>
									<div class="mx-auto d-block">
						       			<a href="<c:url value='/Home'/>">
										<img src="<c:url value='/resources/img/logo.png'/>"  alt="로고이미지"/></a>
									</div>
								</div>	
                        	</div>
                        	                        		
                            <h4>
                            
                            </h4>
                            <div>
                            <!-- 회원가입 form 시작 -->
							<form method="post"  <%-- action="<c:url value='/Register'/>" --%>>
								<div class="form-row">
									<!-- 이메일 입력 필드 시작 -->
									<div class="col-md-7 mx-auto">
										<div class="position-relative form-group">
											<label for="exampleEmail" class=""><span
												class="text-danger">*</span> Email</label>
												<input name="id"
												id="exampleEmail" placeholder="" type="email"
												class="form-control">
										</div>
									</div>
									<!-- 이메일 입력 필드 끝 -->

									<!-- 이름 입력 필드 시작 -->
									<div class="col-md-7 mx-auto">
										<div class="position-relative form-group">
											<label for="exampleName" class=""><span
												class="text-danger">*</span> Name</label>
												<input name="name"
												id="exampleName" placeholder="" type="text"
												class="form-control">
										</div>
									</div>
									<!-- 이름 입력 필드 끝 -->

									<!-- 비밀번호 입력 필드 시작  -->
									<div class="col-md-7 mx-auto">
										<div class="position-relative form-group">
											<label for="examplePassword" class=""><span
												class="text-danger">*</span> Password</label>
												<input name="password"
												id="examplePassword" placeholder="" type="password"
												class="form-control">
										</div>
									</div>

									<div class="col-md-7 mx-auto">
										<div class="position-relative form-group">
											<label for="examplePasswordRep" class=""><span
												class="text-danger">*</span> Repeat Password</label>
												<input name="passwordrep"
												id="examplePasswordRep" placeholder=""
												type="password" class="form-control">
										</div>
									</div>
									<!-- 비밀번호 입력 필드 끝  -->

									<!-- 주소 입력 필드 시작 -->
									<div class="col-md-7 mx-auto">
										<div class="position-relative form-group">
											<label for="mainAddress" class=""><span
												class="text-danger">*</span>Address</label> <input
												style="margin-left: 10px" type="button"
												class="mb-2 mr-2 btn btn-primary btn-sm"
												onclick="sample6_execDaumPostcode()" value="주소 검색"><br>
											<input name="address" id="sample6_address" placeholder=""
												type="text" class="form-control">
										</div>
									</div>

									<div class="col-md-7 mx-auto">
										<div class="position-relative form-group">
											<label for="detailAddress" class=""> Detail Address</label><input
												name="detailAddress" id="sample6_detailAddress"
												placeholder="" type="text" class="form-control">
										</div>
									</div>
									<!-- 주소 입력 필드 끝 -->
								</div>
								<div style="margin-bottom: 200px" class="col-md-7 mx-auto">
									<div class="mt-3 position-relative form-check">
										<input name="check" id="exampleCheck" type="checkbox"
											class="form-check-input"><label for="exampleCheck"
											class="form-check-label"><a
											href="javascript:void(0);"><span style="color: red">ArtPlanet
													회원 약관</span> </a>을 읽어보셨나요?</label>
									</div>
									<div class="mt-4 d-flex align-items-center">
										<h5 class="mb-0">
											이미 가입하셨다구요? <a href="<c:url value='/Login'/>"
												class="text-primary">로그인 해주세요.</a>
										</h5>
										<div class="ml-auto">
											<input type="submit"
												class="btn-wide btn-pill btn-shadow btn-hover-shine btn btn-primary btn-lg" value="회원가입" formaction="<c:url value='/Register'/>">
										</div>
									</div>
								</div>
							</form>
							<!-- 회원가입 form 끝  -->
						</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


<!-- Daum 우편번호 서비스 CDN -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
				}

				//주소 정보를 해당 필드에 넣는다.
				document.getElementById("sample6_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("sample6_detailAddress").focus();
			}
		}).open();
	}
</script>
<script type="text/javascript" src="<c:url value='/resources/kero/assets/scripts/main.07a59de7b920cd76b874.js'/>"/>
</body>
</html>
    