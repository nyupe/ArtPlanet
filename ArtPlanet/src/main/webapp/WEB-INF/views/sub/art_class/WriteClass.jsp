<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 아이디 얻어서 var에 지정한 변수 id저장  페이지내에서 EL 사용하여 (ex. ${id} )아이디값 사용가능-->
<sec:authentication property="principal.username" var="id" />

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<!-- 날짜 및 시간 -->
<script>
	$(function() { //진입점 시작
		var totalcnt = 0;
		$('#btnAddSchedule').click(function() {
							//console.log($('#datepicker').val());
							//console.log($('#timepicker').val());

								$('#scheduleList')
									.append(
											"<button id='scheduleButton' onclick='cancelSchedule(this)' class='btnSchedule mb-2 mr-2 btn btn-link'><span  class='scheduleSpan'>"
													+ $('#datepicker').val()
													+ " "
													+ $('#timepicker').val()
													+ "</span><span  class='badge badge-danger'>취소</span></button>");

							/*
							//if($('#post-tag').val().trim() == '') return false;
							var isExstDate = false;
							//var value = $('.scheduleSpan').html(); 
							$('.scheduleSpan').each(function(i){
								if($(this).html()==$('#btnAddSchedule').val().trim())
									isExstDate = true;
							});
							if(!isExstDate){
								$('#btnAddSchedule').before('<button id="btnAddSchedule" type="button" class="mb-2 mr-2 btn btn-success">'+$('.scheduleSpan').val().trim()+'</span>');
								$('#btnAddSchedule').val('');
							
								
							};
							 */

							/*
							var scheduleSpan1 =document.getElementById(scheduleSpan);
							var i=0;
							var date1;
							var date2;

							for(i=1 i<scheduleSpan1.elements.length; i++){
							 	for(i=1; j<=i; j++){
							 		date1= scheduleSpan1.elements[i].value;
							 		date2= scheduleSpan1.elements[j].value;
							 		
							 		if(date1==date2){
							 			alert("다른 날짜 선택")
							 			return false;
							 			break
							 		}
							 	}
							}
								
							/*
							var value = $('.scheduleSpan').html();
							alert(value);
							//for(i=0; i<value.length; i++){
								//var value = value[i].value.split(" ");
							for(var j=0; j<value.length; j++){
								var tmp = value;
								for(var k=j+1; <=value.length; k++){
									if(tmp == value[k]){
										alert('중복:'+value[k]);
										return;
									}
								}
								
							}*/

							//var cnt = document.getElementById(chsame);
							//var value = $('#chsame').val;
							//var value = $('.schedule'+totalcnt).val();
							/*
							
								var temp = [];
								var obj = $('.scheduleSpan');
								var result = false;
								
								$(obj)
								.each(function(i){
									temp[i] =$(this).val();
								});
								$(temp)
								.each(function(i){
									var x = 0;
									$(obj).each(function(){
										if(temp[i] == $(this).val()){
											xx++;
										}
										
									});
									if(x>1){
										alert('동일');
										result = true;
										return false;
									}
									
								});
							
							 */

							/*
							alert(totalcnt);
							
							if(totalcnt == 0){
								totalcnt++;
								return;
							
							
							
							}
							totalcnt++;
							 */
							/* ----------------------------------------*/
							});

		//드래그앤드랍 다이브
		var objDragAndDrop = $(".dragAndDropDiv");

		$(document).on("dragenter", ".dragAndDropDiv", function(e) {
			e.stopPropagation();
			e.preventDefault();
			$(this).css('border', '1px solid #888');
		});
		$(document).on("dragover", ".dragAndDropDiv", function(e) {
			e.stopPropagation();
			e.preventDefault();
		});
		$(document).on("drop", ".dragAndDropDiv", function(e) {

			$(this).css('border', '1px dotted #888');
			e.preventDefault();
			var files = e.originalEvent.dataTransfer.files;

			classFileUpload(files, objDragAndDrop);
		});

		$(document).on('dragenter', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});
		$(document).on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
			objDragAndDrop.css('border', '1px dotted #888');
		});
		$(document).on('drop', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});

	}); // 진입점 끝

	var cancelSchedule = function(btn) {
		btn.remove();
	}
</script>




<!--    
<script>
function chk_same(){
	
	var chsame ="chsame[]";
	var cnt = document.getElementById(chsame);
	var totalCnt = 0;
	
	for(i=0; i<cnt.length; i++){
		var chksame = cnt[i].value.split(" ");
		
	}
	for(var j=0; j<chsame.length; j++){
		var tmp = chsame[i];
		for(var k=j+1; <=chsame.length; k++){
			if(tmp == chsame[k]){
				alert('중복:'+chsame[k]);
				return;
			}
		}
		
	}
	
}



</script> 
-->

<!--

//-->


<!--    
<script>
function valueDiffer(){
	var temp = [];
	var obj = $('.btnSchedule');
	var result = false;
	
	$(obj)
	.each(function(i){
		temp[i] =$(this).val();
	});
	$(temp)
	.each(function(i){
		var x = 0;
		$(obj).each(function(){
			if(temp[i] == $(this).val()){
				xx++;
			}
			
		});
		if(x>1){
			alert('동일');
			result = true;
			return false;
		}
		
	});
}

</script>
 -->
<!--     
<script>
function valueCheck(eleForm){
	var btnSchedule =doucment.forms[eleForm];
	var i=0;
	var date1;
	var date2;

	for(i=1 i<btnSchedule.elements.length; i++){
	 	for(i=1; j<=i; j++){
	 		date1= btnSchedule.elements[i].value;
	 		date2= btnSchedule.elements[j].value;
	 		
	 		if(date1==date2){
	 			alert("다른 날짜 선택")
	 			return false;
	 			break
	 		}
	 	}
	}
	
	
	
}

</script> 







<style>
	.scheduleDiv {
		
	}
</style>

<!-- 그림 , 입력폼 -->

<script>
	function onlyNumber(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			return false;
	}
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
</script>





<style>
.dragAndDropDiv {
	border: 1px dashed #888;
	width: 100%;
	height: 300px;
	color: #888;
	text-align: center;
	vertical-align: middle;
	padding: 10px 10px 10px 10px;
	font-size: 200%;
	display: table;
}

.progressBar {
	width: 200px;
	height: 22px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	display: inline-block;
	margin: 0px 10px 5px 5px;
	vertical-align: top;
}

.progressBar div {
	height: 100%;
	color: #fff;
	text-align: right;
	line-height: 22px;
	/* same as #progressBar height if we want text middle aligned */
	width: 0;
	background-color: #0ba1b5;
	border-radius: 3px;
}

.statusbar {
	border-top: 1px solid #A9CCD1;
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.statusbar:nth-child(odd) {
	background: #EBEFF0;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 250px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.abort {
	background-color: #A8352F;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 13px;
	font-weight: normal;
	padding: 4px 15px;
	cursor: pointer;
	vertical-align: top
}

.write-form {
	border: 1px solid #ced4da;
	padding: 10px;
}

#post-title {
	color: #1a1d24;
	font-size: 26px;
	padding-top: 1.2em;
	padding-bottom: 1.2em;
}

#post-tag {
	color: #1a1d24;
	font-size: 18px;
	padding-top: 1.1em;
	padding-bottom: 1.1em;
	display: inline;
	width: 30%;
}

.upload-span {
	display: table-cell;
	vertical-align: middle;
}

.tag-div {
	display: inline-block;
	border: 1px solid #888;
	border-radius: 15px;
	margin: 5px;
	font-size: 16px;
}
</style>


<script>
	// 서머노트 실제 생성
	$(document).ready(function() { //진입점 시작
		$('#summernote').summernote({
			height : 400
		});
	}); // 진입점 끝
</script>

<script>
	function classFileUpload(files, obj) {
		for (var i = 0; i < files.length; i++) {
			var fd = new FormData();
			fd.append('file', files[i]);
			fd.append('role', 'artclass'); //role 설정해서 보내주자

			sendFileToServer(fd, status);

		}
	}

	function sendFileToServer(formData, status) {
		var uploadURL = "<c:url value='/FileUploadToCloud'/>"; //Upload URL
		var extraData = {}; //Extra Data.
		var jqXHR = $.ajax({
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			url : uploadURL,
			enctype : "multipart/form-data",
			type : "POST",
			contentType : false,
			processData : false,
			cache : false,
			data : formData,
			dataType : "json",
			success : function(data) {
				console.log(data);
				previewImage(data.fileUrl);
			}
		});

	}

	//summernote 이미지 업로드 요청
	function editorUpload(file, editor) {
		var uploadURL = "<c:url value='/FileUploadToCloud'/>";
		var form_data = new FormData();
		form_data.append('file', file);
		form_data.append('role', 'editor');
		$.ajax({
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			type : "POST",
			enctype : 'multipart/form-data',
			url : uploadURL,
			cache : false,
			contentType : false,
			processData : false,
			data : form_data,
			dataType : "json",
			success : function(data) {
				console.log(data);
				$(editor).summernote('insertImage', data.fileUrl);
			}
		});
	}

	function previewImage(src) {
		$('.previewDiv')
				.append(
						'<img class="previewImg" src="'+src+'" />'
								+ '<div onclick="removeImage(this)" class="removeDiv font-icon-wrapper"><i class="fa fa-fw" aria-hidden="true" title="Remove"></i></div>');
	}
	function removeImage(el) {
		$(el).prev().remove();
		$(el).remove();
	}

	
	//submit 이전에 호출됨
	function postForm() {
		
		// 아트클래스 내용 입력필드에 값 설정
		var content = $('textarea[name="content"]').val($('#summernote').summernote('code'));
		
		// 아트클래스 이미지 입력필드에 값을 넣어주기위한 작업
		// Json객체배열 형태의 문자열로 변환 
		var imagesJson = "{\"images\":[";
		$('.previewImg').each(function(index, item) {
			console.log($(item).attr('src'));
			imagesJson += "{\"src\":\"" + $(item).attr('src') + "\"}";
			if (index < $('.previewImg').length - 1)
				imagesJson += ",";
			else
				imagesJson += "]}";
		});
		
		// 아트클래스 이미지 입력필드(히든으로 감춰져 있음)에 값 설정
		$('#post-imgs').val(imagesJson);
		
		var schedulesJson = "{\"schedules\":[";
		
		$('.btnSchedule').each(function(index, item) {
			console.log($(item).text());
			schedulesJson += "{\"schedule\":\"" + $(item).text().substring(0,$(item).text().length -2) + "\"}";
			if (index < $('.btnSchedule').length - 1)
				schedulesJson += ",";
			else
				schedulesJson += "]}";
		});
		// 아트클래스 개설날짜정보 입력필드(히든으로 감춰져 있음)에 값 설정
		$('#post-schedules').val(schedulesJson);
		
		//서버로 데이터 전송 (submit) - 요청URL : WriteClass / 전송방식 : POST
		$('#class-form').submit();
		
		
		
	}/////postForm()
	
</script>


<div class="container">
	<div class="row">
		<div class="col-md-12" style="padding: 200px;">
			<div class="main-card mb-3 card">
				<!--================Blog Area =================-->

				<div class="dropdown d-inline-block col-md-4">
					<h5 class="card-title" style="margin: 20px;">클래스 종류 선택</h5>
				
				<!------------------------------------ 폼 시작  -------------------------------------------->
					<form action="<c:url value='WriteClass'/>" method="post" id="class-form">
						
						<!-- 스프링 시큐리티 적용 : post 요청시 반드시 토큰 추가 CSRF 공격예방  -->
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						
						<!-- ID 히든으로 넘기기 -->
						<input type="hidden" name="id" value="${id }" />
						
						<input type="hidden" name="title" id="titleName"/>
						
						<!-- 카테고리 선택 필드  -->
						<select class="form-control" name="categorie"
							style="margin: 20px; position: relative; left: 200%;">
							<option>일러스트레이션</option>
							<option>회화</option>
							<option>애니메이션</option>
							<option>디자인</option>
							<option>캘리그라피</option>
							<option>조소/공예</option>
						</select>
				</div>
				
				<div class="main-card mb-3 card">
					<div class="card-body">
						<h5 class="card-title">클래스 소개</h5>
						<section class="blog_area single-post-area area-padding"
							style="padding: 5px;">
							<div class="container">
								<div class="row">
									<div class="col-lg-12 posts-list">
										<div class="write-form">
											
											<div class="form-group" style="margin-top: 10px;">
												<!-- 아트클래스 이름 입력 필드 시작 -->
												<input type="text" name="title" class="form-control"
													id="text-title" placeholder="클래스 이름을 입력하세요">
												<!-- 아트클래스 이름 입력 필드 끝 -->
											</div>
												
										
											<div
												style="font-size: 22px; border-bottom: 1px solid #ced4da; margin: 0 -10px 10px -10px; padding-left: 10px; padding-bottom: 5px;">
												<i class="fa fa-fw" aria-hidden="true"
													title="Copy to use camera"></i> 이미지
											</div>
											
											<div class="card-body">
												<div class="previewDiv" style="text-align: center;"></div>
												<!-- 아트클래스 관련 이미지 업로드 필드 시작 -->
												<div id="fileUpload" class="dragAndDropDiv">
													<span class="upload-span">여기에 파일을 드래그하세요</span>
												</div>
												<!-- 아트클래스 관련 이미지 업로드 필드 끝 -->
											</div>
											
											
											
											<div class="card-body">
												<!-- 섬머노트 시작  -->
												<div id="summernote"></div>
												<!-- 섬머노트 끝 -->
											</div>
											
											
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>


		
				<div class="card-body">
				
					<!-- 아트클래스 난이도 입력 필드 시작  -->
					<div class="form-group row" style="position: relative; left: 20px;">
						<label for="inputPassword"
							class="col-sm-3 text-right col-form-label">클래스 난이도 설정</label>
						<div class="col-sm-6">
							<div class="form-check">
								<input name="classLevel" type="radio" name="toasts"
									class="form-check-input" value="상" checked /> <label
									class="form-check-label" for="exampleRadios1"> 상 </label>
							</div>
							<div class="form-check">
								<input name="classLevel" type="radio" name="toasts"
									class="form-check-input" value="중" checked /> <label
									class="form-check-label" for="exampleRadios1"> 중 </label>
							</div>
							<div class="form-check">
								<input name="classLevel" type="radio" name="toasts"
									class="form-check-input" value="하" checked /> <label
									class="form-check-label" for="exampleRadios1"> 하 </label>
							</div>
						</div>
					</div>
					<!-- 아트클래스 난이도 입력 필드 끝 -->

					
					<div class="card-body"> 

						<!-- 아트 클래스 소요시간 입력필드 시작 -->
						<div class="form-group row">
							<label for="inputPassword"
								class="col-sm-3 text-right col-form-label">클래스 소요시간</label>
							<div class="col-sm-6">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fa fa-fw" aria-hidden="true"
												title="Copy to use hourglass-2"></i>
										</div>
									</div>
									<input name="timeRequired"
										class="form-control input-mask-trigger" im-insert="true"
										style="text-align: right;"
										onkeydown='return onlyNumber(event)'
										onkeyup='removeChar(event)' style='ime-mode:disabled;' /><span
										style="padding: 8px;">시간</span>

								</div>

							</div>
						</div>
						<!-- 아트클래스 수강시간 입력  끝-->

						<!-- 아트 클래스 수강인원 입력 필드 시작 -->
						<div class="form-group row">
							<label for="inputPassword"
								class="col-sm-3 text-right col-form-label">클래스 수강인원 수</label>
							<div class="col-sm-6">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fa fa-fw" aria-hidden="true"
												title="Copy to use child"></i>
										</div>
									</div>
									<input name="numberOfPeople"
										class="form-control input-mask-trigger" im-insert="true"
										style="text-align: right;"
										onkeydown='return onlyNumber(event)'
										onkeyup='removeChar(event)' style='ime-mode:disabled;'>
										<span style="padding: 8px;">명</span>

								</div>

							</div>
						</div>
						<!-- 아트클래스 수강인원 입력필드  끝-->

						<!-- 아트클래스 수강비용 입력필드 시작-->
						<div class="form-group row">
							<label for="inputPassword"
								class="col-sm-3 text-right col-form-label">수강비용</label>
							<div class="col-sm-6">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fa fa-fw" aria-hidden="true"
												title="Copy to use krw"></i>
										</div>
									</div>
									<input name="tuitionFee"
										class="form-control input-mask-trigger"
										data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 0, 'digitsOptional': false, 'prefix': '￦ ', 'placeholder': '0'"
										im-insert="true" style="text-align: right;">

								</div>
							</div>
						</div>
						<!-- 아트클래스 수강비용 입력필드 끝-->
					
					</div>
					
					
					<!-- 아트클래스 개설시각날짜 테이블 관련 입력필드 시작  -->
					<div class="main-card mb-3 card">
						<div class="card-body">
							<h5 class="card-title">시작 날짜 및 시간 설정</h5>
							<div id="scheduleList" class="col-sm-6"
								style="margin: 25px; left: 25%;"></div>

								
							<div class="form-group row">
								<label for="inputPassword"
									class="col-sm-3 text-right col-form-label">날짜를 입력하세요</label>
								<div class="col-sm-6">
									<div class="input-group">
										<div class="input-group-prepend datepicker-trigger">
											<div class="input-group-text">
												<i class="fa fa-calendar-alt"></i>
											</div>
										</div>
										<input id="datepicker" type="text" name="openingDate"
											class="form-control" data-toggle="datepicker-icon" readonly />
									</div>
								</div>
							</div>

							<div class="form-group row">
								<label for="inputPassword"
									class="col-sm-3 text-right col-form-label">시작시간을 선택하세요</label>
								<div class="col-sm-6">
									<div class="input-group">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fa fa-fw" aria-hidden="true"
													title="Copy to use clock-o"></i>
											</div>
										</div>
										<select class="form-control" id="timepicker"
											name="openingTime">
											<option>0:00am</option>
											<option>0:30am</option>
											<option>1:00am</option>
											<option>1:30am</option>
											<option>2:00am</option>
											<option>2:30am</option>
											<option>3:00am</option>
											<option>3:30am</option>
											<option>4:00am</option>
											<option>4:30am</option>
											<option>5:00am</option>
											<option>5:30am</option>
											<option>6:00am</option>
											<option>6:30am</option>
											<option>7:00am</option>
											<option>7:30am</option>
											<option>8:00am</option>
											<option>8:30am</option>
											<option>9:00am</option>
											<option>9:30am</option>
											<option>10:00am</option>
											<option>10:30am</option>
											<option>11:00am</option>
											<option>11:30am</option>
											<option>12:00pm</option>
											<option>12:30pm</option>
											<option>1:00pm</option>
											<option>1:30pm</option>
											<option>2:00pm</option>
											<option>2:30pm</option>
											<option>3:00pm</option>
											<option>3:30pm</option>
											<option>4:00pm</option>
											<option>4:30pm</option>
											<option>5:00pm</option>
											<option>5:30pm</option>
											<option>6:00pm</option>
											<option>6:30pm</option>
											<option>7:00pm</option>
											<option>7:30pm</option>
											<option>8:00pm</option>
											<option>8:30pm</option>
											<option>9:00pm</option>
											<option>9:30pm</option>
											<option>10:00pm</option>
											<option>10:30pm</option>
											<option>11:00pm</option>
											<option>11:30pm</option>
										</select>

									</div>
								</div>
								<button id="btnAddSchedule" type="button"
									class="mb-2 mr-2 btn btn-success">추가</button>

							</div>
							<!-- 아트클래스 개설시각날짜 테이블 관련 입력필드 끝  -->
						</div>
					</div>
				</div>
				
				
				<div class="main-card mb-3 card">
					<div class="card-body">
						<h5 class="card-title">클래스 진행 위치 설정</h5>

						<div class="map_wrap">
							<div id="map"
								style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
							<div id="menu_wrap" class="bg_white">
								<div class="option">
									<div>
									
										<input type="text" placeholder="주소를 입력하세요" id="keyword" size="15">
										<button onclick="searchPlaces(); return false;">검색하기</button>

									</div>
								</div>
								<hr>
								<ul id="placesList"></ul>
								<div id="pagination"></div>
							</div>
						</div>
					</div>
					
					<div class="card-body">
						<div class="col-sm-8">
							<div class="input-group">
								<div class="input-group-prepend">
									<button class="btn btn-secondary" disabled>주소</button>
								</div>
								<input name="classAddress" id="classAddr" type="text"
									class="form-control" readonly>
							</div>
							<br>

							<div class="input-group">
								<div class="input-group-prepend">
									<button id="secondadd" class="btn btn-secondary" disabled>상세주소
									</button>
								</div>
								<input id="detailAddr" name="detailedAddr" type="text"
									class="form-control">
							</div>
						</div>
					</div>
					
				</div>

				<!-- 맵 끝 -->
				
				
				
				<!-- 실제 서버로 전송되는 필드들 (시작) -->
				<!-- 아트클래스 이미지 -->
				<input type="hidden" class="form-control" name="imgs" id="post-imgs">
				<!-- 아트클래스 내용(서머노트에 작성된 글) -->
				<textarea name="content" style="display: none"></textarea>
				<!-- 실제 시간이 입력되는 필드 - JQuery로 처리 -->
				<input id="post-schedules" name="schedules" type="hidden" style="display: none;" value="" />
				<!-- 실제 서버로 전송되는 필드들 (끝) -->
				
				<!-- 등록 버튼  -->
				<div class="card-body">
					<button type="button" onclick="postForm()"
						class="mb-2 mr-2 btn btn-danger btn-lg btn-block">
						클래스 등록하기
					</button>
				</div>
				<!-- 등록 버튼 끝 -->

				</form>
				<!---------------------------------- 폼 끝  ----------------------------------------->
			
			</div>
		</div>
	</div>
</div>



<!-- JS Files -->
<script
	src="<c:url value='/resources/artclass/js/vendor/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/resources/artclass/js/popper.min.js'/>"></script>
<script src="<c:url value='/resources/artclass/js/bootstrap.min.js'/>"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- 카카오맵  --> <!-- API 키입력  -->
<!-- <script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d29cf6db2d1dca112820c1f0483f5b61&libraries=services"></script> -->
	
	<!-- 이종성이 작성한 코드 -->
	
	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=720857926e6d51e1ec90e3642210f71b&libraries=services"></script>



<!--  카카오맵 CSS  -->
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>
<!--  카카오맵 끝 CSS -->



<!-- 카카오맵  --> <!-- API 키입력  -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d29cf6db2d1dca112820c1f0483f5b61&libraries=services">
</script>

<script>
	// 마커를 담을 배열입니다
	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		zIndex : 1
	});

	// 키워드로 장소를 검색합니다
	searchPlaces();

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

		var keyword = document.getElementById('keyword').value;

		if (!keyword.replace(/^\s+|\s+$/g, '')) {
			//alert('키워드를 입력해주세요!'); -> 이 경고창은 왜 있는거죠??
			return false;
		}

		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		ps.keywordSearch(keyword, placesSearchCB);
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {

			// 정상적으로 검색이 완료됐으면
			// 검색 목록과 마커를 표출합니다
			displayPlaces(data);

			// 페이지 번호를 표출합니다
			displayPagination(pagination);

		} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

			alert('검색 결과가 존재하지 않습니다.');
			return;

		} else if (status === kakao.maps.services.Status.ERROR) {

			alert('검색 결과 중 오류가 발생했습니다.');
			return;

		}
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {

		var listEl = document.getElementById('placesList'), 
			menuEl = document.getElementById('menu_wrap'), 
			fragment = document.createDocumentFragment(), 
			bounds = new kakao.maps.LatLngBounds(), 
			listStr = '';

		// 검색 결과 목록에 추가된 항목들을 제거합니다
		removeAllChildNods(listEl);

		// 지도에 표시되고 있는 마커를 제거합니다
		removeMarker();

		for (var i = 0; i < places.length; i++) {

			// 마커를 생성하고 지도에 표시합니다
			var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x), marker = addMarker(
					placePosition, i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(placePosition);
			

			// 마커와 검색결과 항목에 mouseover 했을때
			// 해당 장소에 인포윈도우에 장소명을 표시합니다
			// mouseout 했을 때는 인포윈도우를 닫습니다
			(function(marker, title) {
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					displayInfowindow(marker, title);
				});

				kakao.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});

				itemEl.onmouseover = function() {
					displayInfowindow(marker, title);
				};

				itemEl.onmouseout = function() {
					infowindow.close();
				};

				itemEl.onclick = function() {
					document.getElementById('classAddr').value = $(this).find(
							'div').find('span:first').html();
					$('#detailAddr').focus();
					$('#titleName').attr('value',title);
				}

			})(marker, places[i].place_name);

			fragment.appendChild(itemEl);
		}

		// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		listEl.appendChild(fragment);
		menuEl.scrollTop = 0;

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		map.setBounds(bounds);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {

		var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
				+ (index + 1)
				+ '"></span>'
				+ '<div class="info">'
				+ '   <h5>'
				+ places.place_name + '</h5>';

		if (places.road_address_name) {
			itemStr += '    <span>' + places.road_address_name + '</span>'
					+ '   <span class="jibun gray">' + places.address_name
					+ '</span>';
		} else {
			itemStr += '    <span>' + places.address_name + '</span>';
		}

		itemStr += '  <span class="tel">' + places.phone + '</span>' + '</div>';

		el.innerHTML = itemStr;
		el.className = 'item';

		return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
		var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
		imgOptions = {
			spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset : new kakao.maps.Point(13, 37)
		// 마커 좌표에 일치시킬 이미지 내에서의 좌표
		}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
				imgOptions), marker = new kakao.maps.Marker({
			position : position, // 마커의 위치
			image : markerImage
		});

		marker.setMap(map); // 지도 위에 마커를 표출합니다
		markers.push(marker); // 배열에 생성된 마커를 추가합니다

		return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
		var paginationEl = document.getElementById('pagination'), fragment = document
				.createDocumentFragment(), i;

		// 기존에 추가된 페이지번호를 삭제합니다
		while (paginationEl.hasChildNodes()) {
			paginationEl.removeChild(paginationEl.lastChild);
		}

		for (i = 1; i <= pagination.last; i++) {
			var el = document.createElement('a');
			el.href = "#";
			el.innerHTML = i;

			if (i === pagination.current) {
				el.className = 'on';
			} else {
				el.onclick = (function(i) {
					return function() {
						pagination.gotoPage(i);
					}
				})(i);
			}

			fragment.appendChild(el);
		}
		paginationEl.appendChild(fragment);
	}

	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
		var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
		console.log(title); 

		infowindow.setContent(content);
		infowindow.open(map, marker);
	}

	// 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {
		while (el.hasChildNodes()) {
			el.removeChild(el.lastChild);
		}
	}
</script>

<!-- 카카오맵 끝  -->


