<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 아이디 얻어서 var에 지정한 변수 id저장  페이지내에서 EL 사용하여 (ex. ${id} )아이디값 사용가능-->
<sec:authentication property="principal.username" var="id" />

<style>

.table-responsive{
height: 361px;
margin-bottom: 30px;
overflow-y:scroll;
-ms-overflow-style: none;
}
::-webkit-scrollbar {
display:none;}
.table-responsive tbody td{
height: 50px;
} 
.memberinfo {
margin-left: 100px;
}
.membertitle{
width: 60px;
margin-left: 20px;
}
  




</style>

<script>
//닉네임 유효성 처리
	
	v_nickName = false;
	
/* 
	$(function(){ // 진입점 시작
		$.ajax({
			url:"<c:url value='/GetMeberInfo'/>",
			dataType:'json',
			type: "get",
			data:{id:"${id}"},
			success:displayUserProfile
		})/////ajax
	})// 진입점 끝 */
	
	function nickNameCheck(){
		var nickName = $('#nickName').val();			 			
		$.ajax({
			url:"<c:url value='/ValidationNickName'/>",
			dataType:'text',
			type: "get",
			data:{nickName:$('#nickName').val()},
			success:function(data){
				if(data=='true'){
					$('#nickName').css("background-color","#FFCECE");
					$('#nickNameError').css("color","red");
					$('#nickNameError').text("이미 사용중인 닉네임입니다");
					v_nickName = false;
					nickNameUpdateCheck()
				}
				else if(nickName==''){
					$('#nickName').css("background-color","#FFCECE");
					$('#nickNameError').css("color","red");
					$('#nickNameError').text("닉네임을 입력하세요");
					v_nickName = false;
					nickNameUpdateCheck()
				}
				else if(nickName.length < 3 || nickName.length > 10){
					$('#nickName').css("background-color","#FFCECE");
					$('#nickNameError').css("color","red");
					$('#nickNameError').text("닉네임은 최소 3글자 최대 10글자 이내로 적어주세요");
					v_nickName = false;	
					nickNameUpdateCheck()
				}
				
				else{ 
					$('#nickName').css("background-color", "#B0F6AC");
					$('#nickNameError').css("color","green");
					$('#nickNameError').text("사용가능한 닉네임입니다.");
					v_nickName = true;	
					nickNameUpdateCheck()
				}
			}/////success:function(data)
		})/////ajax
	}/////nickNameCheck()
	
	
	function nickNameUpdateCheck(){
		
		if(v_nickName){//닉네임 중복 아닐시 닉네임변경 활성화
			$("#btn_updateNickName").prop("disabled", false);
		}
		else{//닉네임 중복일시 닉네임변경 버튼 활성화
			$("#btn_updateNickName").prop("disabled", true);
		} 
	}////// 
	
	
	
	
	
	
	/* var displayUserProfile = function(data){
		
		//data 콘솔에 찍어보기 회원정보를 뽑아준
		console.log(data)
		
		
		
		// 프로필 카드 id = card_profile
		//data 프로필 카드안에 넣어줄 테이블 
		var profileTable = "<h5 class='card-title'>"+data.user_name+"님의 회원정보</h5>"
		
		profileTable += "<table class='mb-0 table table-borderless'>" 
		
		profileTable += "<tr>"
		profileTable += "<td rowspan='4'><img style='width: auto;height: auto; max-height: 100px; max-width: 100px' src='/artplanet/ProfilePicture/"+data.user_profilePicture+"' alt='프로필사진'/></td>"
		profileTable += "<td style='font-weight:bold;'>아이디</td><td>"+data.user_id+"</td>"
		profileTable += "</tr>"
		
		profileTable += "<tr>"
		profileTable += "<td style='font-weight:bold;'>닉네임</td><td>"+data.user_nickName+"</td>"
		profileTable += "</tr>"
		
		profileTable += "<tr>"
		profileTable += "<td style='font-weight:bold;'>생년월일</td><td>"+data.user_birth+"</td>"
		profileTable += "</tr>"
		
		profileTable += "<tr>"
		profileTable += "<td style='font-weight:bold;'>주소</td><td>"+data.user_address+"</td>"
		profileTable += "</tr>"
				
		profileTable += "<tr>"
		profileTable += "<td></td><td style='font-weight:bold;'>핸드폰 번호</td><td>"+data.user_phoneNumber+"</td>"
		profileTable += "</tr>"
	
		profileTable += "<tr style='text-align:right'>"
		profileTable += "<td></td><td colspan='3'><br><button data-toggle='modal' data-target='#updateProfile' id='updateProfile' class='mb-2 mr-2 border-0 btn-transition btn btn-outline-primary'>닉네임 변경</button>"
		profileTable += "<button id='deleteMember' button data-toggle='modal' data-target='#deleteMember' class='mb-2 mr-2 btn-hover-shine btn btn-danger'>회원탈퇴</button></td>"
		profileTable += "</tr>"
		
		profileTable += "</table>"
		
		$("#card_profile").html(profileTable);
	
		
		
		
	}/////displayUserProfile */
	
</script>

<!-- profile 수정하는 modal 시작 -->
<div id="updateProfile" class="modal fade" role="dialog"> 
  <div class="modal-dialog" >
	
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">닉네임 변경</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      	<!-- 닉네임 수정폼 시작 -->
	      <form action="<c:url value='/UpdateNickName'/>" method="post"> 
		      <div class="modal-body">
		      	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		      	 <input type="hidden" name="id" value="${id}"/>
		         <input class="form-control" id="nickName" name="nickName" type="text" placeholder="변경하시려는 닉네임을 입력하세요" oninput="nickNameCheck()"/>
		         <div style="margin-top: 10px">
		         	<span id="nickNameError"></span>
		         </div>
		         <br>
		         <button id="btn_updateNickName" type="submit" class="btn btn-primary" disabled="disabled">닉네임 변경</button>
		      </div>
		      <div class="modal-footer">
		        <button type="button" data-dismiss="modal" class="btn btn-danger">취소</button>
		      </div>
	 	 </form>
	 	<!-- 닉네임 수정폼 끝 -->
    </div>
  </div>
</div>
<!-- profile 수정하는 modal 끝-->


<!-- 회원탈퇴 확인 modal 시작 -->
<div id="deleteMember" class="modal fade" role="dialog"> 
  <div class="modal-dialog" >
	
    <!-- Modal content-->
    <div class="modal-content">
     <!--  <div class="modal-header">
        <h4 class="modal-title">회원 탈퇴</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div> -->
      
	      <form action="<c:url value='/DeleteMember'/>" method="post"> 
		      <div class="modal-body" align="center">
		      <div align="center">
		      	<h3>탈퇴하시겠습니까?</h3>
		      </div>
		      	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		      	 <input type="hidden" name="id" value="${id}"/>
		         <br>
		         <button id="btn_updateNickName" type="submit" class="btn btn-danger">네</button>
		      </div>
		      <div class="modal-footer">
		        <button type="button" data-dismiss="modal" class="btn btn-danger">취소</button>
		      </div>
	 	 </form>
	 
    </div>
  </div>
</div>
	
<!-- 회원탈퇴 확인 modal 끝 -->




<!-- 내정보 카드 -->	
<div class="container" style="padding-top: 200px; margin-bottom: 150px">

	<div class="row" style="margin-bottom: 50px">
	
		
		<!-- 이종성 회원 정보 코드 시작  -->
		<div class="col-md-6" align="center">
			<div class="card-shadow-primary card-border mb-3 card">
	            <div class="dropdown-menu-header">
	                <div class="dropdown-menu-header-inner bg-primary">
	                    <div class="menu-header-image"></div>
	                    <div class="menu-header-content">
	                        <div class="avatar-icon-wrapper avatar-icon-lg">
	                            <div class="avatar-icon rounded btn-hover-shine"><img
	                                    src="${memberInfo.profilePicture }"></div>
	                        </div>
	                        <div><h5 class="menu-header-title">${memberInfo.name }</h5>
	                        </div>
	                        
	                    </div>
	                </div>
	            </div>
	            <div >
	                <div class="scrollbar-container">
	                    <ul class="list-group list-group-flush">
	                        <li class="list-group-item">
	                            <div class="widget-content p-0">
	                                <div class="widget-content-wrapper">
	                                    <div class="widget-content-left center-elem mr-2">
	                                        
	                                    </div>
	                                    <div class="widget-content-left">
	                                        <div class="widget-heading membertitle">아이디
	                                        </div>
	                                    </div>
	                                    <div class="widget-content-left memberinfo">
	                                        ${memberInfo.id }
	                                    </div>
	                                </div>
	                            </div>
	                        </li>
	                        <li class="list-group-item">
	                            <div class="widget-content p-0">
	                                <div class="widget-content-wrapper">
	                                    <div class="widget-content-left center-elem mr-2">
	                                        
	                                    </div>
	                                    <div class="widget-content-left">
	                                        <div class="widget-heading membertitle">닉네임
	                                        </div>
	                                    </div>
	                                    <div class="widget-content-left  memberinfo">
	                                        ${memberInfo.nickName }
	                                    </div>
	                                </div>
	                            </div>
	                        </li>
	                        <li class="list-group-item">
	                            <div class="widget-content p-0">
	                                <div class="widget-content-wrapper">
	                                    <div class="widget-content-left center-elem mr-2">
	                                        
	                                    </div>
	                                    <div class="widget-content-left">
	                                        <div class="widget-heading membertitle">생년월일
	                                        </div>
	                                    </div>
	                                    <div class="widget-content-left memberinfo">
	                                        ${memberInfo.birth }
	                                    </div>
	                                </div>
	                            </div>
	                        </li>
	                        <li class="list-group-item">
	                            <div class="widget-content p-0">
	                                <div class="widget-content-wrapper">
	                                    <div class="widget-content-left center-elem mr-2">
	                                        
	                                    </div>
	                                    <div class="widget-content-left">
	                                        <div class="widget-heading membertitle">주소
	                                        </div>
	                                    </div>
	                                    <div class="widget-content-left memberinfo">
	                                        ${memberInfo.address }
	                                    </div>
	                                </div>
	                            </div>
	                        </li>
	                        <li class="list-group-item">
	                            <div class="widget-content p-0">
	                                <div class="widget-content-wrapper">
	                                    <div class="widget-content-left center-elem mr-2">
	                                        
	                                    </div>
	                                    <div class="widget-content-left">
	                                        <div class="widget-heading membertitle">연락처
	                                        </div>
	                                    </div>
	                                    <div class="widget-content-left memberinfo">
	                                        ${memberInfo.phoneNumber }
	                                    </div>
	                                </div>
	                            </div>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	            <div class="text-center d-block card-footer" style="text-align-last:right">
	                <button data-toggle='modal' data-target='#updateProfile' id='updateProfile'  class="mr-2 border-0 btn-transition btn btn-outline-danger" >닉네임 변경
	                </button>
	                <button id='deleteMember' data-toggle='modal' data-target='#deleteMember' class="border-0 btn-transition btn btn-outline-success" >회원 탈퇴
	                </button>
	            </div>
	        </div>
		</div>
		<!-- 이종성 회원 정보 코드 끝  -->
		
		<!-- 개설한 아트 클래스 시작 -->
		<div class="col-md-6" align="center" style="margin-bottom: 50px;">
			<!-- <div class="card" style="width: 500px">
				<div class="card-body" id="card_profile">
					<h4 class="card-title"><span id="user_name"></span>님 프로필</h4>
					<img id="user_profilePicture" style="width: auto;height: auto; max-height: 100px; max-width: 100px"  alt="프로필사진" />
					<p class="card-text">
						아이디:<span id="user_id"></span><br>
						닉네임:<span id="user_nickName"></span><br>
						핸드폰 번호:<span id="user_phoneNumber"></span><br>
						주소:<span id="user_address"></span>
					</p>						
					<a href="#" class="btn btn-primary">내정보 수정</a> 
					<a href="#" class="btn btn-primary">회원탈퇴</a>
				</div>
			</div> -->
			
			  <div class="card-header">
	             <div><h5 class="menu-header-title text-capitalize text-primary">개설한 아트 클래스</h5></div>
	             
	         </div>
	         <div class="table-responsive">
	             <table class="align-middle mb-0 table table-borderless table-striped table-hover">
	                 <thead>
	                 <tr>
	                     <th class="text-center">No</th>
	                     <th class="text-center">Categories</th>
	                     <th class="text-center">Title</th>
	                     <th class="text-center">Address</th>
	                     <th class="text-center">Tuition fee</th>
	                 </tr>
	                 </thead>
	                 <tbody>
	                 <c:forEach items="${classList }" var="item" varStatus="loop">
	                 <tr>
	                     <td class="text-center text-muted" style="width: 80px;">${loop.count }</td>
	                     <td class="text-center">
	                         <div class="badge badge-pill pl-2 pr-2 badge-warning">${item.CATEGORIE }</div>
	                     </td>	
	                     
	                     <!-- 프로그레스바 -->
	                     <!-- <td class="text-center">
	                         <div class="progress-bar-xs progress">
	                             <div class="progress-bar bg-success" role="progressbar"
	                                  aria-valuenow="76" aria-valuemin="0"
	                                  aria-valuemax="100"
	                                  style="width: 76%;"></div>
	                         </div>
	                     </td> -->
	                     <td class="text-center">
	                         <div>${item.TITLE }</div>
	                     </td>
	                     
	                     <td class="text-center" style="width: 150px;">
	                         ${item.ADDRESS }
	                     </td>
	                     <td class="text-center">${item.TUITIONFEE }</td>
	                 </tr>  
	                 </c:forEach> 
	                 </tbody>
	             </table>
	         </div>
		</div>
		<!-- 개설한 아트 클래스 끝 -->
	</div>
	
	
	
	
	
	<div class="row">
		<!-- 내가 만든 크라우드 펀딩 시작 -->
		<div class="col-md-6" align="center" style="margin-bottom: 50px">
			  <div class="card-header">
	             <div><h5 class="menu-header-title text-capitalize text-primary">만든 프로젝트 펀딩</h5></div>
	             
	         </div>
	         <div class="table-responsive">
	             <table class="align-middle mb-0 table table-borderless table-striped table-hover">
	                 <thead>
	                 <tr>
	                     <th class="text-center">No</th>
	                     <th class="text-center">title</th>
	                     <th class="text-center">Target</th>
	                     <th class="text-center">Deadline</th>
	                     <th class="text-center">Date</th>
	                 </tr>
	                 </thead>
	                 <tbody>
	                 <c:forEach items="${projList }" var="item" varStatus="loop"> 
	                 <tr>
	                 	 <!-- NO  -->
	                     <td class="text-center text-muted" style="width: 80px;">${loop.count }</td>
	                     <!-- 제목 -->
	                     <td class="text-center">
	                         <div class="badge badge-pill pl-2 pr-2 badge-warning">${item.TITLE }</div>
	                     </td>	
	                     <!-- 진행된 퍼센트 구하기 -->
	                     <fmt:parseNumber value="${(item.TOTAL *100) / item.TARGETFIGURE  }" integerOnly="true" var="Createpercent" type="number"/>
	                     <!-- 프로그레스바 -->
	                     <td class="text-center" style="width: 200px;">
                             <div class="widget-content p-0">
                                 <div class="widget-content-outer">
                                     <div class="widget-content-wrapper">
	                                     <div class="widget-content-left w-100">
	                                         <div class="progress-bar-xs progress">
	                                             <div class="progress-bar bg-info"
	                                                  role="progressbar" aria-valuenow="88"
	                                                  aria-valuemin="0" aria-valuemax="100"
	                                                  style="width: ${Createpercent}%;"></div>
	                                         </div>
	                                     </div>
	                                     <div class="widget-content-right pr-2">
	                                         <div class="widget-numbers fsize-1 text-info">
	                                             ${Createpercent}%
	                                         </div>
	                                     </div>
	                                 </div>
                                 </div>
                             </div>
                         </td>
	                     
	                     <td class="text-center">
	                         <div>${item.DEADLINE }</div>
	                     </td>
	                     <td class="text-center">${item.POSTDATE }</td>
	                 </tr>   
	                 </c:forEach>
	                 </tbody>
	             </table>
	         </div> 
		</div>
		<!-- 내가 만든 크라우드 펀딩 끝 -->
		
		<!-- 구독중인 작가들 시작 -->
		<div class="col-md-6" align="center">
			 <div class="card-header">
	             
	                 <div><h5 class="menu-header-title text-capitalize text-primary" style="text-align: left;">구독중인 작가들</h5></div>
	                 
	             </div>
	             <div class="table-responsive">
	                 <table class="align-middle text-truncate mb-0 table table-borderless table-hover">
	                     <thead>
	                     <tr>
	                         <th class="text-center">No</th>
	                         <th class="text-center">Profile</th>
	                         <th class="text-center">Name</th>
	                         <th class="text-center">정기구독료</th>
	                         <th class="text-center">작가의블로그</th>
	                     </tr>
	                     </thead>
	                     <tbody>
	                     <c:forEach items="${subscribeList }" var="item" varStatus="loop">
	                     <tr>
	                         <td class="text-center text-muted" style="width: 80px;">${loop.count }</td>
	                         <td class="text-center">
	                             <img width="40" class="rounded-circle"
	                                  src="${item.PROFILEPICTURE }" alt="">
	                         </td>
	                         <td class="text-center">${item.NICKNAME }</td>
	                         <td class="text-center">${item.FEE }</td>
	        				<td class="text-center"><button class="badge badge-pill pl-2 pr-2 badge-warning" onclick="location.href ='Blog/${item.ID }'">블로그가기</button></td>
	                     </tr>
	                     </c:forEach>
	                     </tbody>
	                 </table>
	             </div>
		</div>
		<!-- 구독중인 작가들 끝 -->
	</div>
	
	
	
	
	
	<div class="row">
		<!-- 내가 후원중인 프로젝트 시작  -->
		<div class="col-md-6" align="center" style="margin-bottom: 50px">
			 <div class="card-header">
	                 <div><h5 class="menu-header-title text-capitalize text-primary" style="text-align: left;">후원중인 프로젝트 펀딩</h5></div>
	             </div>
	              <div class="table-responsive">
	                 <table class="align-middle text-truncate mb-0 table table-borderless table-hover">
	                     <thead>
	                     <tr>
	                         <th class="text-center">No</th>
	                         <th class="text-center">Title</th>
	                         <th class="text-center">Funding</th>
	                         <th class="text-center">FundingDate</th>
	                         <th class="text-center">Deadline</th>
	                     </tr>
	                     </thead>
	                     <tbody>
	                     <c:forEach items="${fundingProjList }" var="item"  varStatus="loop">
	                     <fmt:parseNumber value="${(item.TOTAL * 100) / item.TARGETFIGURE }" integerOnly="true" var="PER"></fmt:parseNumber>
	                     <tr>
	                         <td class="text-center text-muted" style="width: 80px;">${loop.count }</td>
	                         <td class="text-center">
	                         <div class="badge badge-pill pl-2 pr-2 badge-warning">${item.TITLE }</div>
	                     	 </td>
	                         
	                         
	                         <td class="text-center" style="width: 200px;">
	                             <div class="widget-content p-0">
	                                 <div class="widget-content-outer">
	                                     <div class="widget-content-wrapper">
                                   			<div class="widget-content-left w-100">
	                                            <div class="progress-bar-xs progress">
	                                                <div class="progress-bar bg-info"
	                                                     role="progressbar" aria-valuenow="88"
	                                                     aria-valuemin="0" aria-valuemax="100"
	                                                     style="width: ${PER}%;"></div>
	                                            </div>
	                                        </div>
                                   			<div class="widget-content-right pr-2">
	                                            <div class="widget-numbers fsize-1 text-info">
	                                                ${PER}%
	                                            </div>
	                                        </div>
	                                     </div>
	                                 </div>
	                             </div>
	                         </td>
	                         <%-- <td class="text-center" style="width: 200px;">${item.PROJECTSUPPORTSUM }</td> --%>
	                         <td class="text-center">${item.PROJECTSUPPORTDATE }</td>
	                         <td class="text-center">${item.DEADLINE }</td>
	                     </tr>
	                     </c:forEach>
	                     </tbody>
	                 </table>
	             </div>
	             <!-- 내가 후원중인 프로젝트 끝  -->
	             <div class="d-block p-4 text-center card-footer">
	             </div>
	             
                                        
			
			
			
		</div>
		
		<div class="col-md-6" align="center">
			 <div class="card-header">	             
	                 <div><h5 class="menu-header-title text-capitalize text-primary" style="text-align: left;">예약한 아트클래스 </h5></div>
	             </div>
	             <div class="table-responsive">
	                 <table class="align-middle text-truncate mb-0 table table-borderless table-hover">
	                     <thead>
	                     <tr>
	                         <th class="text-center">No</th>
	                         <th class="text-center">Categories</th>
	                         <th class="text-center">Title</th>
	                         <th class="text-center">Location</th>
	                         <th class="text-center">Reservation Date</th>
	                     </tr>
	                     </thead>
	                     <tbody>
	                     <c:forEach items="${reservedClassList }" var="item" varStatus="loop">
		                     <tr>
		                         <td class="text-center text-muted" style="width: 80px;">${loop.count }</td>
		                         <td class="text-center"><div class="badge badge-pill pl-2 pr-2 badge-warning">${item.CATEGORIE }</div>
		                         </td>
		                         <td class="text-center">${item.TITLE }
		                         </td>
		                         <td class="text-center">${item.CLASSADDRESS }</td>
		                         <td class="text-center">${item.SIGNUPDATE }</td>
		                     </tr>
	                     </c:forEach>
	                     </tbody>
	                 </table>
	             </div>
	             <div class="d-block p-4 text-center card-footer">
	             </div>
			
			
			
		</div>
		
	</div>
	
</div>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.9.1/dist/Chart.min.js"></script>


<script>
	$(//진입점 window.onload()와 같음
	$.ajax({
		url : 'JsData.js',
		dataType : "script",
		type : "get",
		success : function(data) {
			MyAlert('Hello ', 'World');
		},
		error : function(data){
			alert('차트에러 발생')
		}
	}),

	function() {//무명 메서드
		$('#user_name').html("");
	}

	);
</script>






<script>
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['1월', '2월', '3월', '4월', '5월', '6월'],
        datasets: [{
            label: '구독자 수',
            data: [1300, 1400, 1500, 900, 500, 400], // 여기에 데이터베이스에서 값 가져와야함
           /*  backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ], */
            borderColor: [
                'rgba(255, 99, 132, 1)',
                /* 'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)' */
            ], 
            borderWidth: 2,
        	fill:false   
        },
        
        ]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>

