<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!-- 아이디 얻어서 var에 지정한 변수 id저장 -->
<sec:authentication property="principal.username" var="id" />

<script>

	$(function(){ // 진입점 시작
		
		$.ajax({
			url:"<c:url value='/GetMeberInfo'/>",
			dataType:'json',
			type: "get",
			data:{id:"${id}"},
			success:displayUserProfile
		})/////ajax
	})// 진입점 끝
	
	
	var displayUserProfile = function(data){

		$('#user_id').html(data.user_id)
		$('#user_name').html(data.user_name)
		$('#user_nickName').html(data.user_nickName)
		$('#user_phoneNumber').html(data.user_phoneNumber)
		$('#user_address').html(data.user_address)
	}
	
</script>


<!-- 내정보 카드 -->	
<div class="container" style="padding-top: 200px; margin-bottom: 150px">

	<div class="row" style="margin-bottom: 50px">
	
		<div class="col-md-6" align="center" style="margin-bottom: 50px">
			<div class="card" style="width: 500px">
				<div class="card-body">
					<img src="" alt="프로필사진" />
					<h4 class="card-title"><span id="user_name"></span>님 프로필</h4>
					<p class="card-text">
						아이디:<span id="user_id"></span><br>
						닉네임:<span id="user_nickName"></span><br>
						핸드폰 번호:<span id="user_phoneNumber"></span><br>
						주소:<span id="user_address"></span>
					</p>						
					<a href="#" class="btn btn-primary">내정보 수정</a> 
					<a href="#" class="btn btn-primary">회원탈퇴</a>
				</div>
			</div>
		</div>
		
		<div class="col-md-6" align="center">
			<div class="card" style="width: 500px">
				<div class="card-body">
					<h4 class="card-title">최근 게시물</h4>
					<p class="card-text">여기에 최근 게시물 뿌려줘야함 사진 4~5개 사진 누르면 상세보기 모달창으로 띄워줄것</p>
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

