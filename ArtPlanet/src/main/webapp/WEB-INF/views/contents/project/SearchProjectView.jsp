

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>

html{
scroll-behavior: smooth;
}

#promyImg {
  border-radius: 5px;
  cursor: pointer;
  transition: 0.3s;
}

#promyImg:hover {opacity: 0.7;}

/* The Modal (background) */
.promodal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}

/* Modal Content (image) */
.promodal-content {
  margin: auto;
  display: block;
  width: 110%;
  max-width: 1000px;
}



/* Add Animation */
.promodal-content {  
  -webkit-animation-name: zoom;
  -webkit-animation-duration: 0.6s;
  animation-name: zoom;
  animation-duration: 0.6s;
}

@-webkit-keyframes zoom {
  from {-webkit-transform:scale(0)} 
  to {-webkit-transform:scale(1)}
}

@keyframes zoom {
  from {transform:scale(0)} 
  to {transform:scale(1)}
}



/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
  .promodal-content {
    width: 100%;
  }
}

.pro-container {
  width: 100%;
  background-color: #ddd;
 
}

.pro-skills {
  text-align: right;
  color: white;

}

.pro-html {background-color: #00c4c4;}
.bb:hover {opacity: 0.6; cursor: pointer;}
.prolist li{
list-style:none;
border: 1px solid #eeeeee;
color:#888888;
float: left;
font-size: 13px;
padding: 5px;
margin: 5px;
 
}
.promenu li {
display: inline-block;
font-size: 20px;

}

.promenu li a {
text-align: center;}

#proupdate li{
list-style: inside;
}
#proinfo li{
list-style: inside;
}

.reward li{
list-style: inside;
}

.supportdesc p{
font-size: 1.2em;
margin: auto;
vertical-align: middle;
}
.supportdesc{
margin: auto;}

</style>

<script>
$(document).ready(function(){
	//페이지 로드시 코멘트 목록 뿌려주기]
	showComment();
	
	//코멘트 입력및 수정처리]
	$('#commentsubmit').click(function(){
		
		var action="<c:url value='/Search/Project/Comments'/>";
		
			
		//ajax로 요청]
		$.ajax({
			url:action,
			data:$('#commentForm').serialize(),
			dataType:'text',
			type:'post',
			success:function(data){
				console.log(data);
				console.log('Ajax 성공');
				//등록한후 현재 모든 댓글 뿌려주기
				showComment();
				//입력댓글 클리어 및 포커스 주기
				$('#replyContent').val('');
				$('#replyContent').focus();
				//글 수정후 등록버튼으로 다시 교체하기
				/* if($('#submit').val()=='수정')
					$('#submit').val('등록'); */
			}
		});	
		
	});//#submit
	
});
	
	//현재 글번호에 대한 코멘트 목록을 가져오는 함수-Ajax로 처리
	var showComment= function(){
		console.log('쇼코멘트')
				$.ajax({
			url:"<c:url value='/Search/Project/CommentsList'/>",
			data:{projectNo:${record.projectNo},'_csrf':'${_csrf.token}'},
			dataType:'json',
			type:'post',
			success:displayComments,
			error:function(request,status,error){
				 console.log('응답코드:%s,에러메시지:%s,error:%s,status:%s',
							request.status,request.responseText,error,status);	
			}
		});		
	};//////////showComment
	
	
	var displayComments=function(data){
		console.log('코메느 목록:',data)
		var	comments="<h4 style='float: left;'>Comments</h4>&nbsp;<span class='badge badge-primary'>${commentcount}</span>"
			$.each(data,function(index,element){
				comments+="<div class='comment-list' style='clear: both;'>"
				comments+="<div class='single-comment justify-content-between d-flex'>"
				comments+="<div class='user justify-content-between d-flex'>"
				comments+="<div class='thumb'>"
				comments+="<img src="+"\""+"<c:url value='/resources/img/blog/c1.png'/>"+"\""+ "alt=''>"
				comments+="</div>"
				comments+="<div class='desc'>"
				comments+="<p class='comment'>"+element['REPLYCONTENT']+"</p>"
				comments+="<div class='d-flex justify-content-between'>"
				comments+="<div class='d-flex align-items-center'>"
				comments+="<h5><a href='#'>"+element['ID']+"</a></h5>"
				comments+="<p class='date'>"+element['REPLYPOSTDATE']+"</p>"
				comments+="</div>"
				comments+="<div class='reply-btn'>"
				comments+="<a href='#' class='btn-reply text-uppercase'>reply</a>"
				comments+="</div>"
				comments+="</div>"
				comments+="</div>"
				comments+="</div>"
				comments+="</div>"
				comments+="</div>"
				
			})
			
			comments+="</div>"
			$('#projectcomments').html(comments);
		
		
	}
	

</script>


<!--================Hero Banner Area Start =================-->
<section class="hero-banner">
    <div class="container">
		
    </div>
</section>
<!--================Hero Banner Area End =================-->

<section class="blog_area area-padding">

	<div class="container">
	<aside class="single_sidebar_widget tag_cloud_widget" >
						<h4 class="widget_title" style="margin: 5px;">Tag Clouds</h4>
						<ul class="prolist">
							<li><a href="#">project</a></li>
							<li><a href="#">love</a></li>
							<li><a href="#">technology</a></li>
							<li><a href="#">travel</a></li>
							<li><a href="#">restaurant</a></li>
							<li><a href="#">life style</a></li>
							<li><a href="#">design</a></li>
							<li><a href="#">illustration</a></li>
						</ul>
					</aside>
	<div style="text-align: center;clear: both;"></div>
		<div class="row">
			<div class="col-lg-8 mb-5 mb-lg-0">
				<div class="blog_left_sidebar">
					<article class="blog_item">
						<div class="blog_item_img">
							<img id="promyImg" class="card-img rounded-0" style="width: 80%;height: auto;"
								src="${record.fileurl}" alt=""> <a href="#"
								class="blog_item_date">
								<h3>15</h3>
								<p>Jan</p>
							</a>
						</div>
						<div id="promyModal" class="promodal">
						  <img class="promodal-content" id="proimg01">
						</div>
						
						
					</article>
		
					
					
					<div class="" style="margin-left: 20px;" >
					<ul class="promenu">
						<%-- <li class="nav-item active"><a class="nav-link" href="<c:url value='/Home'/>">Home</a></li> --%>
						<li class="nav-item"><a class="nav-link bb" href="#campaign">Campaign</a></li>
						<li class="nav-item"><a class="nav-link bb" href="#proinfo">Refund-Info</a></li>
						<li class="nav-item"><a class="nav-link bb" href="#proupdate">Update&nbsp;</a></li>
						<li class="nav-item"><a class="nav-link bb" href="#prosupporter">Supporter&nbsp;<span class="badge badge-primary" style="">${supportcount }</span></a></li>
						<li class="nav-item"><a class="nav-link bb" href="#commentlist">Comments&nbsp;<span class="badge badge-primary" style="">4</span></a></li>
						
					</ul>
					
						
					</div>
					
					<div id="campaign">&nbsp;&nbsp;</div>
					<div >&nbsp;</div>
					
					<div class="blog_details" id="campaign">
						
					
						<h2>${record.title }</h2>
						
						<p class="excert">${record.content }</p>
						
						
					</div>
					
					<div id="proinfo">&nbsp;</div>
					<div >&nbsp;</div>
					
					<div class="blog_details">
						
					
						<h2>프로젝트의 환불 및 교환 정책</h2>
						<ul>
						<li>마감일 후에는 즉시 제작에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이 불가능합니다.</li>
						<li>리워드 수령 10일 내 동일 증상으로 3번 이상 수리 시, 환불 가능합니다.</li>
						<li>리워드 수령 10일 이내 제품 하자로 인한 교환/수리 문의는 example@artplanet.com 로 신청 가능합니다.</li>
						<li>제품 하자가 아닌 서포터님 부주의로 인한 제품 손상은 유상수리해 드립니다.</li>
						<li>교환/환불/AS 요청자 정보와 서포터 정보의 일치 여부 확인 후, 진행됩니다.</li>
						</ul>
						
						
					</div>
					<div id="proupdate">&nbsp;&nbsp;</div>
					<div >&nbsp;</div>
					
					<div class="blog_details">
						
					
						<h2 style="float: left;">업데이트 소식</h2>&nbsp;<span class="badge badge-primary" style="">4</span>
						<ul style="clear: both;">
						<li>프로젝트 공통 -마감일 후에는 즉시 제작에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이 불가능합니다.</li>
						<li>프로젝트 공통 -마감일 후에는 즉시 제작에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이 불가능합니다.</li>
						<li>프로젝트 공통 -마감일 후에는 즉시 제작에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이 불가능합니다.</li>
						<li>프로젝트 공통 -마감일 후에는 즉시 제작에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이 불가능합니다.</li>
						<li>프로젝트 공통 -마감일 후에는 즉시 제작에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이 불가능합니다.</li>
						</ul>
						
						
					</div>
					
					<div id="prosupporter">&nbsp;&nbsp;</div>
					<div >&nbsp;</div>
					
					<div class="blog_details">
						
					
						<h2 style="float: left;">현재 이 프로젝트에 <span style="color:#00c4c4 ">${supportcount }명</span>의 참여가 이루어졌습니다</h2>&nbsp;
						
							<c:forEach var="item" items="${list }" varStatus="loops">
							<div class="comment-list" style="clear: both;border-bottom: 1px solid #e6eaed; padding: 20px 0px;">
								<div class="single-comment justify-content-between d-flex">
									<div class="user justify-content-between d-flex">
										<div class="thumb" style="margin: auto 30px auto 0px;">
											<img src="<c:url value='/resources/img/blog/c1.png'/>" alt="">
										</div>
										<div class="supportdesc">
											<p class="comment"><span style="font-weight: bold;">${item.NAME }</span>님이 ${item.PROJECTSUPPORTSUM} 원 펀딩으로 참여하였습니다</p>
		
											<div class="d-flex justify-content-between">
											
											<c:set var="now" value="<%=new java.util.Date()%>" />
											
											<fmt:parseNumber value="${item.PROJECTSUPPORTDATE.time / (1000*60*60)}" integerOnly="true" var="nowdate"></fmt:parseNumber>
											<fmt:parseNumber value="${now.time / (1000*60*60)}" integerOnly="true" var="targetdate"></fmt:parseNumber>
											 
												<div class="d-flex align-items-center">
												<c:if test="${(targetdate - nowdate) < 24 }" var="hour" >
													<p class="date">${targetdate - nowdate}시간 전</p>
												</c:if>
												<c:if test="${not hour }">
													<p class="date">${(targetdate - nowdate)/24 }일 전</p>
												</c:if>
												
												</div>
											</div>
		
										</div>
									</div>
								</div>
							</div>
							</c:forEach> 
						
							
						
						
					</div>
					
					
				
					
					<div id="commentlist">&nbsp;&nbsp;</div>
					<div >&nbsp;</div>
					
					<!-- 코멘트 목록 시작 -->
					
					<div class="comments-area" id="projectcomments">
						<%-- <h4 style="float: left;">Comments</h4>&nbsp;<span class="badge badge-primary">4</span>
						
						<div class="comment-list" style="clear: both;">
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="thumb">
										<img src="<c:url value='/resources/img/blog/c1.png'/>" alt="">
									</div>
									<div class="desc">
										<p class="comment">Multiply sea night grass fourth day sea
											lesser rule open subdue female fill which them Blessed, give
											fill lesser bearing multiply sea night grass fourth day sea
											lesser</p>
	
										<div class="d-flex justify-content-between">
											<div class="d-flex align-items-center">
												<h5>
													<a href="#">Emilly Blunt</a>
												</h5>
												<p class="date">December 4, 2017 at 3:12 pm</p>
											</div>
	
											<div class="reply-btn">
												<a href="#" class="btn-reply text-uppercase">reply</a>
											</div>
										</div>
	
									</div>
								</div>
							</div>
						</div> 
						--%>
						
					</div>
				
				
				<!-- 코멘트 목록 끝 -->
				
				<!-- 댓글 입력 폼  시작-->
				<div class="comment-form">
					<h4>Leave a Reply</h4>
					<form class="form-contact comment_form" action="#" id="commentForm" onsubmit="return false">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<textarea class="form-control w-100" name="replyContent"
										id="replyContent" cols="30" rows="9" placeholder="댓글을 입력해주세요"></textarea></div>
							</div>
							
						</div>
						<input type="hidden" name="projectNo" value="${record.projectNo}" />
						<input type="hidden" name="replyNo" />
						<input type="hidden" name="replyPostDate" />
						<input type="hidden" name="memberNo" value="${record.memberNo }" /> 
						<!-- 로그인 연결 안해서 memberNo는 임시로 글등록한 memberNo로 가져와서 등록 중 -->
						<div class="form-group">
							<button id="commentsubmit" type="submit" class="button button-contactForm">등록</button>
						</div>
					</form>
				</div>
				<!-- 댓글 입력 폼  끝-->

					



					
				</div>
			</div>
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget search_widget" style="padding: 0px 30px 30px 30px;">
						<div class="menu-header-content" style="text-align: center; ">
							<div class="row" >
							<fmt:parseNumber value="${fundInfo.projectsupportsum / fundInfo.targetFigure * 100 }" integerOnly="true" var="per" type="number"></fmt:parseNumber>
								<div class="col-100" style="width: 100%; text-align: left; font-weight: bold; font-size: xx-large;margin-bottom: 20px;">진행중인 펀딩</div>
								<div class="pro-container" >
									<div class="pro-skills pro-html" style="width: ${per}%">&nbsp;</div>
								</div>
								
								<div class="col-50" style="width:1000%; text-align: left; font-size:small; margin-bottom: 20px;"><span>${per}</span>% 달성</div>
								<div class="col-70" style="width:100%; text-align: left; font-size:large; margin-bottom: 20px;"><span style="font-weight: bold;">${fundInfo.projectsupportsum }</span>원  모집</div>
								<div class="col-70" style="width:100%; text-align: left; font-size:large; margin-bottom: 20px;white-space: pre;"><span style="font-weight: bold;">${supportcount }</span>명 후원</div>
								
								<!-- <p style="text-align: left; font-weight: bold;">모인금액</p>
								<p style="text-align: left ; font-size:medium;">750,000</p>
								<p style="text-align: left; font-size:small;float: :left;" >목표 금액</p><span>300000</span> -->
							</div>
							<div class="row" style="padding:5px;margin-bottom: 20px; ">
								<div style="width:50%;text-align: left;font-weight: bold;">목표금액</div><span style="font-weight: bold;">${fundInfo.targetFigure }</span>
							<fmt:parseNumber value="${fundInfo.postDate.time / (1000*60*60*24)}" integerOnly="true" var="now"></fmt:parseNumber>
							<fmt:parseNumber value="${fundInfo.deadline.time / (1000*60*60*24)}" integerOnly="true" var="target"></fmt:parseNumber>
								<div style="width:50%;text-align: left;font-weight: bold;">남은기간</div><span style="font-weight: bold;">${target - now }</span>
								<div style="text-align:left;width:100%; height:auto; overflow-wrap: break-word;margin-top: 5px;">#100%이상 모이면 펀딩이 성공되는 프로젝트입니다 , 해당 프로젝트는 펀딩 마감일 까지 목표금액이 100% 모이지 않으면 <span style="font-weight: bold;color: red;">결제</span>가 되지 않습니다</div>
							</div>
							
							<div class="row" style="margin-bottom: 20px;" >
								
								<form action="<c:url value='/Search/Project/ProjectWrite'/>" style="width: 100%;margin: 10px 0px;">
									<button class="bb primary-bg text-white w-100" type="submit" style="background: #00c4c4;border: none;height: 50px;border-radius: 2px;font-weight: bold;cursor: pointer;margin-bottom: 20px;">후원하기</button>
								</form>
								
								<form action="<c:url value='#'/>" style="width: 32%;">
									<button class="bb  w-100" type="submit" style="border: 1px solid #dadce0;background:#fff ;height: 50px;border-radius: 2px;font-weight: bold;color: black;">SHARE</button>
								</form>
								
								<form action="<c:url value='#'/>" style="width: 32%;  margin: 0px 7px; ">
									<button class="bb w-100" type="submit" style="border: 1px solid #dadce0;background:#fff ;height: 50px;border-radius: 2px;font-weight: bold;color: black;">FQA</button>
								</form>
								<form action="<c:url value='#'/>" style="width: 32%;">
									<button class="bb w-100" type="submit" style="border: 1px solid #dadce0;background:#fff ;height: 50px;border-radius: 2px;font-weight: bold;color: black;">LIKE</button>
								</form>
								
								
							</div>
							
							
							
						</div>
						
					</aside>

					<aside class="single_sidebar_widget popular_post_widget" style="border: 1px solid #dadce0; margin: 10px;">
						<h3 class="widget_title" style="margin-bottom: 20px;border: none;">리워드 선택</h3>
						<div class="media post_item">
							<form>
								<h3 style="margin-bottom: 20px;">39,000 <span style="font-size: 16px;"> 원 펀딩</span></h3>
								<ul class="reward" style="padding-bottom: 20px;margin-bottom: 20px;">
									<li>뮤직비디오 크레딧 등록 (×1)</li>
									<li>패키지 메일 제공-[옴니버스]EP 음원, 뮤직비디오, 프로필 사진, 뮤비 스냅 사진 (×1)</li>
									<li>스페셜 음감회(뮤비 GV 포함)티켓 (×1)</li>
								</ul>
								<button type="button" class="bb" style="width: 100%;border: none;height: 50px;cursor: pointer;background: #00c4c4;color: white;">선물 선택하고 후원하기</button>
							</form>
						</div>
						
						<div class="media post_item" >
							<form>
								<h3 style="margin-bottom: 20px;">49,000 <span style="font-size: 16px;"> 원 펀딩</span></h3>
								<ul class="reward" style="padding-bottom: 20px;margin-bottom: 20px;">
									<li>뮤직비디오 크레딧 등록 (×1)</li>
									<li>패키지 메일 제공-[옴니버스]EP 음원, 뮤직비디오, 프로필 사진, 뮤비 스냅 사진 (×1)</li>
									<li>스페셜 음감회(뮤비 GV 포함)티켓 (×1)</li>
								</ul>
								<button type="button" class="bb "style="width: 100%;border: none;height: 50px;cursor: pointer;background: #00c4c4;color: white;">선물 선택하고 후원하기</button>
							</form>
						</div>
						
						
					</aside>
					<!-- <aside class="single_sidebar_widget tag_cloud_widget">
						<h4 class="widget_title">Tag Clouds</h4>
						<ul class="list">
							<li><a href="#">project</a></li>
							<li><a href="#">love</a></li>
							<li><a href="#">technology</a></li>
							<li><a href="#">travel</a></li>
							<li><a href="#">restaurant</a></li>
							<li><a href="#">life style</a></li>
							<li><a href="#">design</a></li>
							<li><a href="#">illustration</a></li>
						</ul>
					</aside> -->
				</div>
			</div>
		</div>
	</div>
</section>

<script>
// Get the modal
var modal = document.getElementById("promyModal");

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById("promyImg");
var modalImg = document.getElementById("proimg01");
img.onclick = function(){
	console.log("클릭됨");
  modal.style.display = "block";
  modalImg.src = this.src;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("promodal-content")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
  modal.style.display = "none";
}
</script>
