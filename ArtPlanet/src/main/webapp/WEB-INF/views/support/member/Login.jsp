<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script>
		
		// 아이디 저장(쿠키사용) 기능 로직
		$(document).ready(function(){ // 진입점
		    
			var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
		    
			$("input[name='id']").val(userInputId); 
		     
		    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
		                                           // 아이디 저장하기 체크되어있을 시,
		        $("#idSave").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		    }/////if
		     
		    $("#idSave").change(function(){ // 체크박스에 변화가 발생시
		        if($("#idSave").is(":checked")){ // ID 저장하기 체크했을 때,
		            var userInputId = $("input[name='id']").val();
		            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
		        }else{ // ID 저장하기 체크 해제 시,
		            deleteCookie("userInputId");
		        }
		    });///// $("#idSave").change(function(){})
		     
		    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		        if($("#idSave").is(":checked")){ // ID 저장하기를 체크한 상태라면,
		            var userInputId = $("input[name='id']").val();
		            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
		        }
		    });///// $("input[name='id']").keyup(function(){})
		    
		}); // 진입점 끝
		
	
		/* 위에 있는 아이디 저장 기능 로직에서 호출되는 함수들 */
		
		//쿠키 설정
		function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		
		//쿠키 삭제
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		
		//쿠기 가져오기
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}
			
</script>


<style>
		.header_area {
			display: none;
		}
		.footer-area {
			display: none;
		}
		.single-footer-widget {
			display: none;
		}
</style>



     <div class="app-container app-theme-white body-tabs-shadow">
            <div class="app-container">
                <div class="h-100">
                    <div class="h-100 no-gutters row">
                        <div class="d-none d-lg-block col-lg-4">
                            <div class="slider-light">
                                <div class="slick-slider">
                                    <div>
                                        <div class="h-100 d-flex justify-content-center align-items-center bg-plum-plate" tabindex="-1">
                                            <div class="slide-img-bg" style="background-image: url('resources/kero/assets/images/originals/city.jpg');"></div>
                                            <div class="slider-content"><h3>그림을 통해 소통을...</h3>
                                                <p>ArtPlanet에서는 그림을 통해 서로 소통하며...</p></div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="h-100 d-flex justify-content-center align-items-center bg-premium-dark" tabindex="-1">
                                            <div class="slide-img-bg" style="background-image: url('resources/kero/assets/images/originals/citynights.jpg');"></div>
                                            <div class="slider-content"><h3>좀 더 그림에 집중할 수 있게....</h3>
                                                <p>ArtPlanet에서는 그림에 집중할 수 있게 후원 시스템을...</p></div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="h-100 d-flex justify-content-center align-items-center bg-sunny-morning" tabindex="-1">
                                            <div class="slide-img-bg" style="background-image: url('resources/kero/assets/images/originals/citydark.jpg');"></div>
                                            <div class="slider-content"><h3>좋아하는 그림에 쉽게 다가갈 수 있게...</h3>
                                                <p>ArtPlanet에서는 자신이 좋아하는 그림에 좀더 쉽게 다가갈 수 있게...</p></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="h-100 d-flex bg-white justify-content-center align-items-center col-md-12 col-lg-8">
                            <div class="mx-auto app-login-box col-sm-12 col-md-10 col-lg-9">
                               <div class="col" align="center" style="margin-bottom: 25px; margin-top: 150px">
                                	<a href="<c:url value='/Search/Artwork'/>">	<img  class="img-fluid" src="<c:url value='/resources/img/logo.png'/>"  alt="로고이미지"/></a>
                                </div>
                                <!-- 로그인 하지 않은 상태라면   -->
                                <sec:authorize access="isAnonymous()">
                                	<c:if test="${param.erorr!=null }">
										<div class="row">
											<div class="alert alert-warning fade in  col-sm-5">
												<button type="button" class="close" data-dismiss="alert">
													<span>&times;</span>
												</button>
												아이디와 비번이 틀려요
											</div>
										</div>
									</c:if>	
                                <h4 class="mb-0">
                                    <span class="d-block"><span class="text-primary">ArtPlanet</span>에 오신걸 환영합니다,</span>
                                    <span>로그인 해주세요.</span></h4>
                                <h6 class="mt-3">회원이 아니시라구요? 
                                <br/>
                                
                                	<a href="<c:url value='/AuthStart.do'/>" class="text-danger">이곳을 클릭하여 회원가입하세요.</a> 
                                </h6>
                                <div class="divider row"></div>
                                <div style="padding-bottom: 100px">
                                
                                	
									
                                    <form action="<c:url value='/LoginProcess'/>" method="post" >
                                    	<!-- 씨큐리티 쓰려면 바로 밑 소스 한줄 무조건 넣어야함 -->
									    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                                        <div class="form-row">
                                        	
                                            <div class="col-md-6">
											<div class="position-relative form-group">
	                                                <label for="exampleEmail" class="">ID</label>
	                                                <!-- 아이디 입력태그 -->
	                                                <input name="id" id="id" placeholder="ID를 입력하세요..." type="text" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="position-relative form-group">
                                                	<label for="examplePassword" class="">Password</label>
                                                	<!-- 비밀번호 입력태그  -->
                                                	<input name="password" id="password" placeholder="Password을 입력하세요..." type="password" class="form-control">
                                                </div>
                                            </div>
                                            
                                        </div>
                                       
                                        <div class="position-relative form-check">
	                                        
	                                        <c:if test="${param.error != null }">
	                                        	<label class="text-danger">
	                                        		아이디와 비밀번호가 틀렸습니다.
	                                        	</label>
	                                        </c:if>
											<br>	
	                                        <input type="checkbox" name="idSave" id="idSave"  />
											<label for="idSave">아이디 저장</label>
	                                        
	                                        
                                        </div>
                                        
                                        <div class="divider row"></div>
                                        <div class="d-flex align-items-center">
                                            <div class="ml-auto">
                                            <a href="<c:url value='/ForgotPassword'/>" class="btn-lg btn btn-link">
                                            	<span class="text-danger">비밀번호 찾기</span>
                                            </a>
                                                <input type="submit" value="로그인" class="btn btn-primary btn-lg"/>
                                            </div>
                                        </div>
                                    </form>
                                 </sec:authorize>
                                 <!-- 로그인된 사용자라면 -->
                                 <sec:authorize access="isAuthenticated()">
									<div class="alert alert-success col-md-5">
										<sec:authentication property="principal.username" />
										님 즐감하세요
									</div>
								</sec:authorize>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
	<script type="text/javascript" src="<c:url value='/resources/kero/assets/scripts/main.07a59de7b920cd76b874.js'/> "/>

    