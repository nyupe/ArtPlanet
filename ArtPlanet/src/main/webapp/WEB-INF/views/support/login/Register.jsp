<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page import="kr.co.kcp.CT_CLI"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>



<%
    /* = -------------------------------------------------------------------------- = */
    /* =   환경 설정 파일 Include END                                               = */
    /* ============================================================================== */

    /* ============================================================================== */
    /* =   Hash 데이터 생성 필요 데이터                                             = */
    /* = -------------------------------------------------------------------------- = */
    /* = 사이트코드 ( up_hash 생성시 필요 )                                         = */
    /* = -------------------------------------------------------------------------- = */

    String site_cd   = "S6186";

    /* = -------------------------------------------------------------------------- = */
    /* = 요청번호  ( up_hash 생성시 필요 )                                           = */
    /* = -------------------------------------------------------------------------- = */

    String ordr_idxx = "TEST" + (new SimpleDateFormat("yyyyMMddHHmmssSSSSSSS").format(new Date())); // 요청번호 생성 예제
	
    
    /* = -------------------------------------------------------------------------- = */
%>

   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

    <!-- Disable tap highlight on IE -->
    <meta name="msapplication-tap-highlight" content="no">
	
	<!-- 본인인증(핸드폰)을 위한 자바스크립트 코드 시작  -->
	<script type="text/javascript">
			 
            // 인증창 종료 후 인증데이터 리턴 함수
            function auth_data( frm )
            {
                var auth_form     = document.form_auth;
                var nField        = frm.elements.length;
                var response_data = "";
                // up_hash 검증 
                if( frm.up_hash.value != auth_form.veri_up_hash.value )
                {
                    alert("up_hash 변조 위험있음");
                }              
               /* 리턴 값 모두 찍어보기 (테스트 시에만 사용) */
                var form_value = "";
                for ( i = 0 ; i < frm.length ; i++ )
                {
                    form_value += "["+frm.elements[i].name + "] = [" + frm.elements[i].value + "]\n";
                }
                alert(form_value);
            }
            
            // 인증창 호출 함수
            function auth_type_check()
            {
                var auth_form = document.form_auth;
                if( auth_form.ordr_idxx.value == "" )
                {
                    alert( "요청번호는 필수 입니다." );
    
                    return false;
                }
                else
                {
                    if( ( navigator.userAgent.indexOf("Android") > - 1 || navigator.userAgent.indexOf("iPhone") > - 1 ) == false ) // 스마트폰이 아닌경우
                    {
	                    var return_gubun;
	                    var width  = 410;
	                    var height = 500;
	
	                    var leftpos = screen.width  / 2 - ( width  / 2 );
	                    var toppos  = screen.height / 2 - ( height / 2 );
	
	                    var winopts  = "width=" + width   + ", height=" + height + ", toolbar=no,status=no,statusbar=no,menubar=no,scrollbars=no,resizable=no";
	                    var position = ",left=" + leftpos + ", top="    + toppos;
	                    var AUTH_POP = window.open('','auth_popup', winopts + position);
                    }
                    
                    auth_form.target = "auth_popup"; // !!주의 고정값 ( 리턴받을때 사용되는 타겟명입니다.)
                    auth_form.action = "./kcpcert_proc_req.jsp"; // 인증창 호출 및 결과값 리턴 페이지 주소
                    
                    return true;
                }
            }
        </script>
        <!-- 본인인증(핸드폰)을 위한 자바스크립트 코드 끝  -->
	
		<!-- 기존 kero CSS -->
		<link href="<c:url value='/resources/kero/main.07a59de7b920cd76b874.css'/>" rel="stylesheet">
		
		<body>
    		<div class="app-container app-theme-white body-tabs-shadow">
            	<div class="app-container">
                	<div class="h-100">
                    	<div class="h-100 no-gutters row">
                        	<div style="margin-left: 350px"class="h-100 d-md-flex d-sm-block bg-white justify-content-center align-items-center col-md-12 col-lg-7">
                            	<div class="mx-auto app-login-box col-sm-12 col-md-10 col-lg-9">
                                	<div style="margin-bottom: 50px; margin-left: 100px">
                                		<a href="<c:url value='/Home'/>"><img src="<c:url value='/resources/aboutsign/assets/images/artplanetLogo.png'/>"  alt="로고이미지"/></a>
                                	</div>
                                <h4>
                                    <div>환영합니다!</div>
                                    <span>회원가입을 위해  <span style="color: red;">아래 사항들을</span> 입력해주세요</span></h4>
                                <div>
                                    <form name="form_auth" action="https://testcert.kcp.co.kr/kcp_cert/cert_intro.jsp?no_Cache=">
                                   
                                        <div class="form-row">                                    
                                            <div class="col-md-6">
                                                <div class="position-relative form-group"><label for="exampleEmail" class=""><span class="text-danger">*</span> Email</label><input name="email" id="exampleEmail" placeholder="" type="email"
                                                                                                                                                                                    class="form-control"></div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="position-relative form-group"><label for="exampleName" class=""><span class="text-danger">*</span> Name</label><input name="text" id="exampleName" placeholder="" type="text" class="form-control"></div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="position-relative form-group"><label for="examplePassword" class=""><span class="text-danger">*</span> Password</label><input name="password" id="examplePassword" placeholder=""
                                                                                                                                                                                          type="password" class="form-control"></div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="position-relative form-group"><label for="examplePasswordRep" class=""><span class="text-danger">*</span> Repeat Password</label><input name="passwordrep" id="examplePasswordRep"
                                                                                                                                                                                                    placeholder="" type="password"
                                                                                                                                                                                                    class="form-control"></div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="position-relative form-group"><label for="mainAddress" class=""><span class="text-danger">*</span> Address</label><input name="Address" id="exampleAddress"
                                                                                                                                                                                                    placeholder="" type="text"
                                                                                                                                                                                                    class="form-control"></div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="position-relative form-group"><label for="detailAddress" class=""><span class="text-danger">*</span> Detail Address</label><input name="DetailAddress" id="exampleDetailAddress"
                                                                                                                                                                                                    placeholder="" type="text"
                                                                                                                                                                                                    class="form-control"></div>
                                            </div>
                                            
                                        </div>
                                        <div class="mt-3 position-relative form-check"><input name="check" id="exampleCheck" type="checkbox" class="form-check-input"><label for="exampleCheck" class="form-check-label"><a href="javascript:void(0);"><span style="color: red">ArtPlanet 회원 약관</span>
                                            </a>을 읽어보셨나요?</label></div>
                                        <div class="mt-4 d-flex align-items-center"><h5 class="mb-0">이미 가입하셨다구요? <a href="<c:url value='/Login'/>" class="text-primary">로그인 해주세요.</a></h5>
                                            <div class="ml-auto">
                                                <button class="btn-wide btn-pill btn-shadow btn-hover-shine btn btn-primary btn-lg">회원가입</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
    </div>
    
	<script type="text/javascript" src="<c:url value='/resources/kero/assets/scripts/main.07a59de7b920cd76b874.js'/>"></script>
	</body>
</html>
    