<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!-- 아이디 얻어서 var에 지정한 변수 id저장  페이지내에서 EL 사용하여 (ex. ${id} )아이디값 사용가능-->
<sec:authentication property="principal.username" var="id" />

<script>
//닉네임 유효성 처리
	
	v_nickName = false;
	

	$(function(){ // 진입점 시작
		$.ajax({
			url:"<c:url value='/GetMeberInfo'/>",
			dataType:'json',
			type: "get",
			data:{id:"${id}"},
			success:displayUserProfile
		})/////ajax
	})// 진입점 끝
	
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
	
	
	
	
	
	
	var displayUserProfile = function(data){
		
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
	
		
		
		
	}/////displayUserProfile
	
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
	
		<div class="col-md-6" align="center" style="margin-bottom: 50px">
			<div class="card" style="width: 500px">
				<div class="card-body" id="card_profile">
					<!-- <h4 class="card-title"><span id="user_name"></span>님 프로필</h4>
					<img id="user_profilePicture" style="width: auto;height: auto; max-height: 100px; max-width: 100px"  alt="프로필사진" />
					<p class="card-text">
						아이디:<span id="user_id"></span><br>
						닉네임:<span id="user_nickName"></span><br>
						핸드폰 번호:<span id="user_phoneNumber"></span><br>
						주소:<span id="user_address"></span>
					</p>						
					<a href="#" class="btn btn-primary">내정보 수정</a> 
					<a href="#" class="btn btn-primary">회원탈퇴</a> -->
				</div>
			</div>
		</div>
		
		<div class="col-md-6" align="center">
			<div class="card" style="width: 500px">
				<div class="card-body">
					<h4 class="card-title"><span id="user_name_blog"></span>님의 최근 블로그 게시물</h4>
					<p class="card-text">여기에 최근 게시물  사진 4~5개  썸네일로 뿌려줘야함 사진 누르면 상세보기 모달창으로 띄워줄것</p>
					<a href="#" class="btn btn-primary">내 블로그로 가기</a>
				</div>
			</div>
		</div>
		
	</div>
	
	<div class="row">
	
		<div class="col-md-6" align="center" style="margin-bottom: 50px">
			<div class="card" style="width: 500px">
				<div class="card-body">
					<h4 class="card-title">최근 구독 및 수입 현황</h4>
					<p class="card-text">월별 구독자 수</p>
					<canvas id="myChart" width="100" height="100"></canvas>
					<a href="#" class="btn btn-primary">구독 및 수입 현황 상세보기</a>
				</div>
			</div>
		</div>
		
		<div class="col-md-6" align="center">
			<div class="card" style="width: 500px">
				<div class="card-body">
					<h4 class="card-title">여긴 채팅형식으로 메시지함?</h4>
					<p class="card-text"></p>
					<a href="#" class="btn btn-primary">메시지함으로 이동</a>
				</div>
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

