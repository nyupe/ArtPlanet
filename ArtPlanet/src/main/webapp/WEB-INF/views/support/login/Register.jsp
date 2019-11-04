<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="kr.co.kcp.CT_CLI"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String site_cd   = "S6186"; //사이트 코드
	String ordr_idxx = "TEST" + (new SimpleDateFormat("yyyyMMddHHmmssSSSSSSS")
			.format(new Date())); // 요청번호 생성 예제
	boolean flag = false;			
%>
<!doctype html>
<html lang="en">
<head>
    <title>Register page</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"/>
    <meta name="description" content="Kero HTML Bootstrap 4 Dashboard Template"/>
    
    <!-- 제이쿼리 코어 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- 핸드폰 인증 로직 JS -->	
	<script type="text/javascript" src="<c:url value='/resources/js/CertificationByPhone.js'/>"></script>
	
	<!-- 유효성 검증 관련 로직 -->
	<script>
	var v_id = false;
	var v_name = false;
	var v_password = false;
	var v_address = false;
	
		function idCheck(){
			var id = $('#id').val();			 			
			$.ajax({
				url:"<c:url value='/Validation'/>",
				dataType:'text',
				type: "get",
				data:{id:$('#id').val()},
				success:function(data){
					if(data=='true'){
						$('#id').css("background-color","#FFCECE");
						$('#idError').css("color","red");
						$('#idError').text("이미 사용중인 아이디입니다");
						v_id = false;
					}
					else if(id==''){
						$('#id').css("background-color","#FFCECE");
						$('#idError').css("color","red");
						$('#idError').text("아이디를 입력하세요");
						v_id = false;
					}
					else if(id.length < 5 || id.length > 13){
						$('#id').css("background-color","#FFCECE");
						$('#idError').css("color","red");
						$('#idError').text("아이디는 최소 5글자 최대 13글자 이내로 적어주세요");
						v_id = false;						
					}
					
					else{ 
						$('#id').css("background-color", "#B0F6AC");
						$('#idError').css("color","green");
						$('#idError').text("사용가능한 아이디입니다.");
						v_id = true;						
					}
				}/////success:function(data)
			})/////ajax
		}/////idCheck()
		
		function nameCheck(){
			var name = $('#name').val();
			if(name==''){ 
				$('#name').css("background-color","#FFCECE");
				$('#nameError').css("color","red");
				$('#nameError').text("이름을 입력하세요");
				v_name = false;
			}
			else{
				$('#name').css("background-color", "#B0F6AC");
				$('#nameError').css("color","green");
				$('#nameError').text("");
				v_name = true;
			}
		}/////nameCheck()
		
		function passwordCheck(){
			var password = $('#password').val();
			if(password==''){
				$('#password').css("background-color","#FFCECE");
				$('#passwordError').css("color","red");
				$('#passwordError').text("비밀번호를 입력하세요");
				v_password = false;
			}
			else if(password.length < 5 || password.length > 13){
				$('#password').css("background-color","#FFCECE");
				$('#passwordError').css("color","red");
				$('#passwordError').text("비밀번호는 최소 5자리 및 최대 13자리 이내로 입력해주세요");
				v_password = false;
			}
			else{
				$('#password').css("background-color", "#B0F6AC");
				$('#passwordError').css("color","green");
				$('#passwordError').text("");
				v_password = true;
				
			}
		}/////passwordCheck()
		
		function passwordConfirmCheck(){
			var passwordConfirm = $('#passwordConfirm').val();
			if(passwordConfirm=='' || $('#password').val() != passwordConfirm ){
				$('#passwordConfirm').css("background-color","#FFCECE");
				$('#passwordConfirmError').css("color","red");
				$('#passwordConfirmError').text("비밀번호를 다시 입력하세요");
				v_password = false;
			}
			else{
				$('#passwordConfirm').css("background-color", "#B0F6AC");
				$('#passwordConfirmError').css("color","green");
				$('#passwordConfirmError').text("");
				v_password = true;
			}
		}/////passwordCheck()
		
		function addressCheck(){
			var address = $('#address').val();
			if(address==''){
				$('#address').css("background-color","#FFCECE");
				$('#addressError').css("color","red");
				$('#addressError').text("주소를 입력하세요");
				v_address = false;
			}
			else{
				$('#address').css("background-color", "#B0F6AC");
				$('#addressError').css("color","green");
				$('#addressError').text("");
				v_address = true;
			}
		}
		
		function validation(){
			var checkbox = $("input:checkbox[id='membershipTerms']").is(":checked");
			console.log(checkbox);
			if(checkbox && v_id && v_name && v_password && v_address ){
				alert("회원가입에 성공하였습니다");
				$.ajax({
					data:
				
				})
			}
				
			else{
				if(!checkbox && v_id && v_name && v_password && v_address)
					alert("회원가입에 실패하였습니다 : 약관에 체크해주세요!");
				else
					alert("회원가입에 실패하였습니다");
			}
		}
		
	</script>		
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
                        	<!-- 사이트 logo 시작-->
								<div class="col" align="center" style="margin-bottom: 25px; margin-top: 150px">
                                	<a href="<c:url value='/Search/Artwork'/>">	<img  class="img-fluid" src="<c:url value='/resources/img/logo.png'/>"  alt="로고이미지"/></a>
                                </div>
                        	</div>
                        	<!-- 사이트 logo 끝-->                        		
                            <h4>
                            
                            </h4>
                            <div>
                            <!-- 회원가입 form 시작 --> 
							<form method="post"  action="<c:url value=''/>"  >
								<div class="form-row">
									<!-- ID 입력 필드 시작 -->								
									<div class="col-md-7 mx-auto">
										<div class="position-relative form-group">
											<label for="exampleEmail" class=""><span
												class="text-danger">*</span> ID</label>
												<!-- ID 입력태그  -->
												<input name="id" value="${param.id}"
												id="id" placeholder="" type="text" oninput="idCheck()"
												class="form-control">
												<!-- 아이디 유효성 체크 안내문 -->
												<span id ="idError"></span><br>
										</div>
									</div>
									<!-- ID 입력 필드 끝 -->
				
									<!-- 이름 입력 필드 시작 -->
									<div class="col-md-7 mx-auto">
										<div class="position-relative form-group">
											<label for="exampleName" class=""><span
												class="text-danger">*</span> Name</label>
											<!-- 이름 입력태그  -->
											<input name="name" value="${param.name}" oninput="nameCheck()"
												id="name" placeholder="" type="text"
												class="form-control">
											<span id="nameError">${nameError }</span>
										</div>
									</div>
									<!-- 이름 입력 필드 끝 -->

									<!-- 비밀번호 입력 필드 시작  -->
									<div class="col-md-7 mx-auto">
										<div class="position-relative form-group">
											<label for="examplePassword" class=""><span
												class="text-danger">*</span> Password</label>
											<!-- 비밀번호 입력태그  -->
											<input name="password" value="${param.password}"
												id="password" placeholder="" type="password" oninput="passwordCheck()"
												class="form-control">
											<span id="passwordError"></span>
										</div>
									</div>

									<div class="col-md-7 mx-auto">
										<div class="position-relative form-group">
											<label for="examplePasswordRep" class=""><span
												class="text-danger">*</span> Repeat Password</label>
											<!-- 비밀번호 확인 입력태그  -->
											<input name="passwordConfirm" value="${param.passwordConfirm}"
												id="passwordConfirm" placeholder="" oninput="passwordConfirmCheck()"
												type="password" class="form-control">
											<span id="passwordConfirmError"></span>
										</div>
									</div>
									<!-- 비밀번호 입력 필드 끝  -->

									<!-- 주소 입력 필드 시작 -->
									<div class="col-md-7 mx-auto">
										<div class="position-relative form-group">
											<label for="mainAddress" class=""><span
												class="text-danger">*</span>Address</label> 
												<input
												style="margin-left: 10px;" type="button"
												class="mb-2 mr-2 btn-icon btn-shadow btn-outline-2x btn btn-outline-primary btn-sm"
												onclick="sample6_execDaumPostcode()" value="주소 검색"><br>
											<!-- 주소 입력태그  -->
											<input name="address" value="${param.address}"
											id="address" placeholder="" oninput = "addressCheck()"
												type="text" class="form-control">
											<span id="addressError"></span>
										</div>
									</div>

									<div class="col-md-7 mx-auto">
										<div class="position-relative form-group">
											<label for="detailAddress" class=""> Detail Address</label>
											<!-- 상세주소 입력태그  -->
											<input
												name="detailAddress" value="${param.detailAddress}"
												id="detailAddress" 
												placeholder="" type="text" class="form-control">
										</div>
									</div>
									<!-- 주소 입력 필드 끝 -->
								</div>
								<div style="margin-bottom: 200px" class="col-md-7 mx-auto">
									<div class="mt-3 position-relative form-check">
										<!-- 체크박스  -->
										<input name="checkMembershipTerms" value="동의" id="membershipTerms" 
										type="checkbox" class="form-check-input" >
											<label for="exampleCheck" class="form-check-label">
											<a href="javascript:void(0);"><span class="text-primary">ArtPlanet회원 약관</span> </a>을 읽고 체크해주세요</label>
											<span class="text-danger">${checkMembershipTermsError }</span>		
									</div>
									<div class="mt-4 d-flex align-items-center">
										<h5 class="mb-0">
											이미 가입하셨다구요? 
											<!-- 로그인 화면으로 이동  -->
											<a href="<c:url value='/Login'/>" class="text-primary">로그인 해주세요.</a>
										</h5>
										<div class="ml-auto">
											<!--회원가입 버튼  -->
											<input type="button" id="btnRegister" onclick="validation()"
												class="btn-wide btn-pill btn-shadow btn-hover-shine btn btn-primary btn-lg" value="회원가입" >
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
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}
</script>
<script type="text/javascript" src="<c:url value='/resources/kero/assets/scripts/main.07a59de7b920cd76b874.js'/>"/>
</body>
</html>
    