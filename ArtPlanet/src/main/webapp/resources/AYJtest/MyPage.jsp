<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>MyPage</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link href="<c:url value='/resources/kero/main.07a59de7b920cd76b874.css'/>" rel="stylesheet"></head>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.1/dist/Chart.min.js"></script>
  
  <script type="text/javascript" src="<c:url value='/resources/kero/assets/scripts/main.07a59de7b920cd76b874.js'/>"></script>
  
  <style>
 	.jumbotron{
		   
		   padding:0px;
		   background-color: white;
		   
	}
  </style>
</head>
<body>

<div class="jumbotron" >
	<div class="container-fluid">
		<div class="row" />
			<div class="col" >
				<img   class="img-fluid" src="<c:url value='/resources/img/logo.png'/>" alt="로고이미지" />
			</div>
			<div class="col" align="right" style="vertical-align: bottom;">
					<div style="margin: 10px">
						<h1 style="margin: 25px">내정보</h1>
					</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				  <a class="navbar-brand" href="#">메인으로 돌아가기</a>
				  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
				    <span class="navbar-toggler-icon"></span>
				  </button>
				  <div class="collapse navbar-collapse" id="collapsibleNavbar">
				    <ul class="navbar-nav">
				      <li class="nav-item">
				        <a class="nav-link" href="#">회원정보</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="#">구독정보</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="#">문의사항</a>
				      </li>    
				    </ul>
				  </div>  
				</nav>
			</div>
		</div>
</div>





	<!-- 내정보 카드 -->	
	<div class="container" style="margin-top:100px">
  
		<div class="row" style="margin-bottom: 50px">
			<div class="col" align="center" style="margin-bottom: 50px">
				<div class="card" style="width: 500px">
					<div class="card-body">
						<img src="" alt="프로필사진" />
						<h4 class="card-title">무슨무슨님 프로필</h4>
						<p class="card-text">성함 : <br>아이디: <br>닉네임: <br>핸드폰 번호: <br>주소:</p>
						<a href="#" class="btn btn-primary">내정보 수정</a> 
						<a href="#" class="btn btn-primary">회원탈퇴</a>
					</div>
				</div>
			</div>
			
			<div class="col" align="center">
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
			<div class="col" align="center" style="margin-bottom: 50px">
				<div class="card" style="width: 500px">
					<div class="card-body">
						<h4 class="card-title">최근 구독 및 수입 현황</h4>
						<p class="card-text">월별 구독자 수</p>
						<canvas id="myChart" width="100" height="100"></canvas>
						<a href="#" class="btn btn-primary">구독 및 수입 현황 상세보기</a>
					</div>
				</div>
			</div>
			
			<div class="col" align="center">
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

<div><br><br><br></div>
<div class="jumbotron text-center" style="margin-bottom:0; padding: 0;">
  <p>Copyright © ArtPlanet 2019</p>
</div>

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
</body>

</html>
