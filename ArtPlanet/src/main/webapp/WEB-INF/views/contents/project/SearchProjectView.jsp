

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%-- <sec:authentication property="principal.username" var="id"/> --%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<sec:authorize access="hasRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="id"/>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<sec:authentication property="principal.username" var="id"/>
</sec:authorize>

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
  height: 25px;
 
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
padding: 5px 10px;
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



/* The Modal (background) */
.modal {
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
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}



/* Modal Content */
.modal-content {
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding: 0;
  border: 1px solid #888;
  width: 50%;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
  -webkit-animation-name: animatetop;
  -webkit-animation-duration: 0.4s;
  animation-name: animatetop;
  animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
  from {top:-300px; opacity:0} 
  to {top:0; opacity:1}
}

@keyframes animatetop {
  from {top:-300px; opacity:0}
  to {top:0; opacity:1}
}

/* The Close Button */
.close {
  color: white;
  float: right;
  font-size: 28px;
  font-weight: bold;
  margin: -1rem -1rem -1rem -1rem;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
    color: #da624a;
  text-align: center;
}

.modal-body {

padding: 2rem;
text-align: left;


}

.input-mask-trigger{
width: 40%;
display: inline;
}

.project-refund li{
margin-bottom: 10px;
}

.update {
clear: both;
}



</style>

<script>
$(document).ready(function(){
	//페이지 로드시 코멘트 목록 뿌려주기]
	showComment();
	
	var newURL = "https:"+window.location.protocol + "//" + window.location.host +  window.location.pathname +"?" + "projectNo=${record.projectNo}"
	
	console.log(newURL);
	//코멘트 입력및 수정처리]
	$('#commentsubmit').click(function(){
		
		if($('.idComment').val() == ""){
			alert('로그인 해주세요');
			return;
		}
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
	
});//$(document).ready
	
	//현재 글번호에 대한 코멘트 목록을 가져오는 함수-Ajax로 처리
	var showComment= function(){
		console.log('쇼코멘트')
			$.ajax({
			url:"<c:url value='/Search/Project/CommentsList'/>",
			data:{projectNo:'${record.projectNo}','_csrf':'${_csrf.token}'},//////////////////////
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
		var commentcounts = 0;
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
				if('${id}' == element['ID']){
				comments+="<div class='update-btn' style='cursor:pointer;margin:0px 10px;'>"
				comments+="<a class='btn-update text-uppercase' name='"+element['REPLYNO']+"'>수정</a>"
				comments+="</div>"
				comments+="<div class='delete-btn' style='cursor:pointer'>"
				comments+="<a class='btn-delete text-uppercase'  name='"+element['REPLYNO']+"'>삭제</a>"
				comments+="</div>"
				}
				comments+="</div>"
				comments+="</div>"
				comments+="</div>"
				comments+="</div>"
				comments+="</div>"
				commentcounts++;
			})
			
			comments+="</div>"
			$('.badgecomment').html(commentcounts)
			$('#projectcomments').html(comments);
			
			
			$('.btn-delete').click(function(){
				$.ajax({
					url:'<c:url value="/Search/Project/CommentsDelete"/>',
					data:{replyNo:$(this).attr('name'),'_csrf':'${_csrf.token}'},
					type:'post',
					success:function(){showComment();}
				})
			})
			
			$('.btn-update').click(function(){
				$.ajax({
					url:'<c:url value="/Search/Project/CommentsUpdate"/>',
					data:{replyNo:$(this).attr('name'),'_csrf':'${_csrf.token}'},
					type:'post',
					success:function(){showComment();}
				})
			})
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
							<c:forEach items="${tagList}" var="item">
								<li>${item.TAGNAME}</li>
							</c:forEach>
						</ul>
					</aside>
	<div style="text-align: center;clear: both;"></div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-lg-8 mb-5 mb-lg-0">
				<div class="blog_left_sidebar">
					<article class="blog_item">
						<div class="blog_item_img">
							<img id="promyImg" class="card-img rounded-0" style="width: 80%;height: auto;"
								src="${record.fileurl}" alt=""> <a href="#"
								class="blog_item_date">
								
								<fmt:formatDate value="${record.postDate }" var="prodate" pattern="dd"/>
								<fmt:formatDate value="${record.postDate }" type="date" var="promonth" pattern="MMM"/>
								<h3>${prodate}</h3>
								<p>${promonth}</p>
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
						<li class="nav-item"><a class="nav-link bb" href="#commentlist">Comments&nbsp;<span class="badge badge-primary badgecomment" style=""></span></a></li>
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
						<ul class="project-refund" style="list-style: inside;">
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
							<h2 style="float: left;">업데이트 소식</h2>&nbsp;<span class="badge badge-primary" style="margin-bottom: 15px; padding-top: 10px;">${updatecount }</span>
							<c:if test="${record.id == id }">
							<form class="update" style="clear: both;margin-bottom: 10px;" method="post" action="<c:url value='/Search/Project/projectUpdate'/>">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<input type="hidden" name="projectNo" value="${record.projectNo}" />
								<textarea class="form-control w-100" name="updateContent" style="clear: both;"
									id="updateContent" cols="30" rows="3" placeholder="업데이트를 내용을 입력해주세요"></textarea>
								<button type="submit" class="bb" 
										style="border-radius:4px;border: #da624a 1px solid ;cursor: pointer;
										background: #da624a;color: white;font-size: 1.1em; float: right;margin-top: 10px;">등록하기</button>								
							</form>
							</c:if>
							<c:forEach var="item" items="${updateList }">
								<ul style="clear: both;list-style: inside;">
									<li>${item.UPDATECONTENT }</li>
								</ul>
							</c:forEach>
					</div>
					
					<div id="prosupporter">&nbsp;&nbsp;</div>
					<div >&nbsp;</div>
					<!-- 서포터 리스트 시작 -->
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
											<p class="comment"><span style="font-weight: bold;">${item.NICKNAME }</span>님이 ${item.PROJECTSUPPORTSUM} 원 펀딩으로 참여하였습니다</p>
		
											<div class="d-flex justify-content-between">
											
											<c:set var="now" value="<%=new java.util.Date()%>" />
											
											<fmt:parseNumber value="${item.PROJECTSUPPORTDATE.time / (1000*60*60)}" integerOnly="true" var="nowdate"></fmt:parseNumber>
											<fmt:parseNumber value="${now.time / (1000*60*60)}" integerOnly="true" var="targetdate"></fmt:parseNumber>
											 
												<div class="d-flex align-items-center">
												<c:if test="${(targetdate - nowdate) < 24 }" var="hour" >
													<p class="date">${targetdate - nowdate}시간 전</p>
												</c:if>
												<c:if test="${not hour }">
													<fmt:parseNumber value="${(targetdate - nowdate)/24}" integerOnly="true" var="goneDate"></fmt:parseNumber>
													<p class="date">${goneDate }일 전</p>
												</c:if>
												
												</div>
											</div>
		
										</div>
									</div>
								</div>
							</div>
							</c:forEach> 
							
					</div>
					<!-- 서포터 리스트 끝 -->
					
					
				
					
					<div id="commentlist">&nbsp;&nbsp;</div>
					<div >&nbsp;</div>
					
					<!-- 코멘트 목록 시작 -->
					<div class="comments-area" id="projectcomments">
						
						
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
						<input type="hidden" class="idComment" name="id" value="${id }" /> 
						<div class="form-group">
							<button id="commentsubmit" type="submit" class="button button-contactForm">등록</button>
						</div>
					</form>
				</div>
				<!-- 댓글 입력 폼  끝-->
					
				</div>
			</div>
			<div class="mb-3 progress-bar-animated-alt progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
								style="width: 30%;"></div>
							</div>
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget search_widget" style="padding: 0px 30px 30px 30px;">
						<div class="menu-header-content" style="text-align: center; ">
							<div class="row" >
							<fmt:parseNumber value="${fundInfo.projectsupportsum / fundInfo.targetFigure * 100 }" integerOnly="true" var="per" type="number"></fmt:parseNumber>
							
								<div class="col-100" style="width: 100%; text-align: left; font-weight: bold; font-size: xx-large;margin-bottom: 20px;">진행중인 펀딩</div>
								<div class="pro-container progress-bar-animated-alt progress" >
									<div class="pro-skills pro-html progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: ${per}%;max-width:100%;">&nbsp;</div>
								</div>
								
							<fmt:formatNumber value="${fundInfo.projectsupportsum }" type="number" maxFractionDigits="3" var="total"></fmt:formatNumber>
							<fmt:formatNumber value="${fundInfo.targetFigure }" type="number" maxFractionDigits="3" var="target"></fmt:formatNumber>	
								<div class="col-50" style="width:100%; text-align: left; font-size:small; margin-bottom: 20px;"><span>${per}</span>% 달성</div>
								<div class="col-70" style="width:100%; text-align: left; font-size:large; margin-bottom: 20px;"><span style="font-weight: bold;">${total }</span>원  모집</div>
								<div class="col-70" style="width:100%; text-align: left; font-size:large; margin-bottom: 20px;white-space: pre;"><span style="font-weight: bold;">${supportcount }</span>명 후원</div>
								
								<!-- <p style="text-align: left; font-weight: bold;">모인금액</p>
								<p style="text-align: left ; font-size:medium;">750,000</p>
								<p style="text-align: left; font-size:small;float: :left;" >목표 금액</p><span>300000</span> -->
							</div>
							<div class="row" style="padding:5px;margin-bottom: 20px; ">
								<div style="width:50%;text-align: left;font-weight: bold;">목표금액</div><span style="font-weight: bold;">${target }원</span>
							<fmt:parseNumber value="${fundInfo.postDate.time / (1000*60*60*24)}" integerOnly="true" var="now"></fmt:parseNumber>
							<fmt:parseNumber value="${fundInfo.deadline.time / (1000*60*60*24)}" integerOnly="true" var="target"></fmt:parseNumber>
								<div style="width:50%;text-align: left;font-weight: bold;">남은기간</div><span style="font-weight: bold;">${target - now }일</span>
								<div style="text-align:left;width:100%; height:auto; overflow-wrap: break-word;margin-top: 5px;">#100%이상 모이면 펀딩이 성공되는 프로젝트입니다 , 해당 프로젝트는 펀딩 마감일 까지 목표금액이 100% 모이지 않으면 <span style="font-weight: bold;color: red;">결제</span>가 되지 않습니다</div>
							</div>
							
							<div class="row" style="margin-bottom: 20px;" >
								
								<!-- 후원 모달창 시작 -->
								<div id="myModal" class="modal">
								  <!-- Modal content -->
								  <div class="modal-content">
								    <div class="modal-header">
								      
								      <h2 style="margin: auto;">아티스트들을 위한 "크라우드 펀딩"</h2>
								      <span class="close">&times;</span>
								    </div>
								    <div class="modal-body">
								    	<div>
								        	<div class="media post_item">
												<form role="form" method="post" action="<c:url value='/ProjectAuthReq.do'/>" style="width: 100%">
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
													
													
													<input type="hidden" class="idSupport" name="id" value="${id }" />
													<input type="hidden" name="projectNo" value="${record.projectNo}"/>
													
													<h3 id="cheon">1000원 이상 후원하시는 분께</h3>
													<input type="text" class="form-control input-mask-trigger" id="projectSupportSum" name="projectSupportSum" 
													data-inputmask="'alias': 'numeric','groupSeparator': ',', 'autoGroup': true," placeholder="후원액을 설정해주세요" 
													style="clear:both;margin: 10px 0px;text-align: left;"/>원 후원하기
													<ul class="reward" style="padding-bottom: 20px;margin-bottom: 20px;">
														<li>선물을 선택하지 않고 후원만 합니다</li>
														
													</ul>
													<button type="submit" class="bb" style="width: 100%;border: none;height: 50px;cursor: pointer;background: #00c4c4;color: white;">후원만 하기</button>
												</form>
											</div>
								        </div>
								        <c:forEach items="${rewardList }" var="item">
								    	<h3 class="widget_title" style="margin-bottom: 20px;border: none;"></h3>
								        <div>
								        	<div class="media post_item">
												<form style="width: 100%" role="form" method="post" action="<c:url value='/ProjectAuthReq.do'/>">
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
													<input type="hidden" class="idSupport" name="id" value="${id }" />
													<input type="hidden" name="projectNo" value="${record.projectNo}"/>
													<input type="hidden" name="projectSupportSum" value="${item.SUPPORTSTEP }"/>
													<h3 style="margin-bottom: 20px;">${item.SUPPORTSTEP }  <span style="font-size: 16px;"> 원 후원하기</span></h3>
													<ul class="reward" style="padding-bottom: 20px;margin-bottom: 20px;">
														<li>${item.REWARDCONTENT }</li>
													</ul>
													<button type="submit" class="bb" style="width: 100%;border: none;height: 50px;cursor: pointer;background: #00c4c4;color: white;">선물 선택하고 후원하기</button>
												</form>
											</div>
								        </div>
								        </c:forEach>
								    </div>
								  </div>
								</div>
								<!-- 후원 모달창 끝 -->
								
								<!-- 리워드 등록 시작  -->
								<div id="rewardModal" class="modal">
								  <!-- Modal content -->
								  <div class="modal-content">
								    <div class="modal-header">
								      
								      <h2 style="margin: auto;"></h2>
								      <span class="close">&times;</span>
								    </div>
								    <div class="modal-body">
								   		<h3 class="widget_title" style="margin-bottom: 20px;border: none;">리워드 등록하기</h3>
								    	<div>
								        	<div class="media post_item">
												<form role="form" method="post" action="<c:url value='/Search/Project/projectreward'/>" style="width: 100%">
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
													<input type="hidden" name="projectNo" value="${record.projectNo}"/>
													<input type="text" class="form-control input-mask-trigger" id="supportStep" name="supportStep" 
													data-inputmask="'alias': 'numeric','groupSeparator': ',', 'autoGroup': true," placeholder="후원 금액을 입력해주세요" 
													style="clear:both;margin: 10px 0px;text-align: left;"/>원으로 설정하기
													<input class="form-control w-100 rewardtext1" type="text" placeholder="첫번째 리워드 보상 입력해주세요" style="margin-bottom: 10px"/>
													<input class="form-control w-100 rewardtext2" type="text" placeholder="두번째 리워드 보상 입력해주세요" style="margin-bottom: 10px"/>
													<input class="form-control w-100 rewardtext3" type="text" placeholder="세번째 리워드 보상 입력해주세요" style="margin-bottom: 10px"/>
													<textarea class="form-control w-100" name="rewardContent" hidden="true"
													id="rewardContent" cols="30" rows="9" ></textarea>
													<div style="text-align: center;margin-top: 15px;">
														<button type="submit" class="bb rewardwrite" style="width: 15%;border: none;height: 50px;cursor: pointer;background: #00c4c4;color: white;">리워드 등록</button>
													</div>
												</form>
											</div>
								        </div>								         
								    </div>
								  </div>
								</div>
								
								<!-- 리워드 등록 끝  -->
								
								
								<c:if test="${record.id == id }" var="writercheck">
									<button class="bb primary-bg text-white w-100" id="myBtn" type="submit" style="background: #00c4c4;border: none;height: 50px;border-radius: 2px;font-weight: bold;cursor: pointer;margin-bottom: 20px;">리워드 등록하기</button>
								</c:if>
								<c:if test="${not writercheck }">
									<button class="bb primary-bg text-white w-100" id="myBtn" type="submit" style="background: #00c4c4;border: none;height: 50px;border-radius: 2px;font-weight: bold;cursor: pointer;margin-bottom: 20px;">후원하기</button>
								</c:if>
								<c:if test="${writercheck }">
								<div class="row" style="width: 100%;margin: auto;">
									<form class="col-6" method="post" action="<c:url value='/Search/Project/projectUpdate'/>">
										<div style="text-align: center;margin-top: 15px;">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
											<input type="hidden" name="projectNo" value="${record.projectNo}" />
											<button type="submit" class="bb" 
											style="width: 100%;border-radius:2px;border: #00c4c4 1px solid ;height: 50px;cursor: pointer;background: white;color: #00c4c4;">프로젝트 수정</button>
										</div>
									</form>
									<form class="col-6" role="form" action="<c:url value='/Search/Project/projectDelete'/>">
										<div style="text-align: center;margin-top: 15px;">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
											<input type="hidden" name="projectNo" value="${record.projectNo}" />
											<button type="submit" class="bb" 
											style="width: 100%;border-radius:2px;border: #00c4c4 1px solid ;height: 50px;cursor: pointer;background: white;color: #00c4c4;">프로젝트 삭제</button>
										</div>
									</form>
								</div>
								</c:if>
								
								<%-- <form action="<c:url value='#'/>" style="width: 32%;">
									<button class="bb  w-100" type="submit" style="border: 1px solid #dadce0;background:#fff ;height: 50px;border-radius: 2px;font-weight: bold;color: black;">SHARE</button>
								</form>
								
								<form action="<c:url value='#'/>" style="width: 32%;  margin: 0px 7px; ">
									<button class="bb w-100" type="submit" style="border: 1px solid #dadce0;background:#fff ;height: 50px;border-radius: 2px;font-weight: bold;color: black;">FQA</button>
								</form>
								<form action="<c:url value='#'/>" style="width: 32%;">
									<button class="bb w-100" type="submit" style="border: 1px solid #dadce0;background:#fff ;height: 50px;border-radius: 2px;font-weight: bold;color: black;">LIKE</button>
								</form> --%>
								<div class="row" style="display: flex;margin-top: 20px;justify-content: center;">
									<!-- 카카오톡 공유  시작 -->
									<c:set var="URL" value="http://localhost:8080/artplanet/Search/Project/ProjectView?projectNo=${record.projectNo} " />
									<span class="sociallink ml-1 col-2">
									    <a href="javascript:sendLinkKakao()" id="kakao-link-btn" title="카카오톡으로 공유">
									        <img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" alt="Kakaotalk">
									    </a>
									</span>
									<span class="sociallink ml-1 col-2">
									<a>
									<img src="<c:url value='/resources/img/project/facebook.png'/>" style="cursor: pointer;" /></a>
									</span>
									<span class="sociallink ml-1 col-2" >
									<img src="<c:url value='/resources/img/project/twitter.png'/>"  style="cursor: pointer;"/>
									</span>
									<span class="sociallink ml-1 col-2" >
									<img src="<c:url value='/resources/img/project/Copy.png'/>" style="cursor: pointer;" />
									</span>
								</div>
								<script>
								
								Kakao.init('e48160c4b97a640dbc60d607fb8fcb59');
								
								function sendLinkKakao(){
								
								    Kakao.Link.sendDefault({
								      objectType: 'feed',
								      content: {
								          title: '${record.title}', //프로젝트 제목
								          description: '${tags}', //프로젝트 태그
								          imageUrl: '${record.fileurl}', //프로젝트 이미지
								          link: {
								            mobileWebUrl: 'https://developers.kakao.com', //이미지 클릭시 이동할 url
								            webUrl: 'https://www.naver.com' //클릭시 이동할 url
								          }
								      },
								      social: {
								          likeCount: 0, //프로젝트 좋아요 수
								          commentCount: 20, //프로젝트 댓글 수
								          sharedCount: 0 //프로젝트 공유 수
								        },
								        buttons: [
								            {
								              title: '웹으로 보기', //공유 할때 하단에 보여줄 버튼
								              link: {
								                mobileWebUrl: 'https://developers.kakao.com', //버튼 클릭시 이동할 url
								                webUrl: '${URL}' //버튼 클릭시 이동할 url
								              }
								            },
								            {
								              title: '앱으로 보기', //공유 할때 하단에 보여줄 버튼
								              link: {
								                mobileWebUrl: 'https://developers.kakao.com', //버튼 클릭시 이동할 url
								                webUrl: 'https://developers.kakao.com' //버튼 클릭시 이동할 url
								              }
								            }
								          ]
								    });
									
								}
								
								
								</script>
								
								
							</div>
							
							
							
						</div>
						
					</aside>
					
					<aside class="single_sidebar_widget popular_post_widget" style="border: 1px solid #dadce0; margin: 10px;">
						<h3 class="widget_title" style="margin-bottom: 20px;border: none;">리워드 선택</h3>
						<c:forEach items="${rewardList }" var="item" varStatus="loop">
						<div class="media post_item">
							<form style="width: 100%" >
								<h3 style="margin-bottom: 20px;">${item.SUPPORTSTEP } <span style="font-size: 16px;"> 원 펀딩</span></h3>
								<ul class="reward" style="padding-bottom: 20px;margin-bottom: 20px;">
									<c:forEach var="item" items="${rewardcontent[loop.index] }">
									<li>${item}</li>
									</c:forEach>
								</ul>
								<c:if test="${record.id == id }" var="deletecheck">
									<button type="button"  class="bb rewardDelete${loop.index }" style="width: 100%;border: none;height: 50px;cursor: pointer;background: #00c4c4;color: white;">리워드 삭제하기</button>
								</c:if>
								<c:if test="${not deletecheck}">
									<button type="button" class="bb rewardFund" style="width: 100%;border: none;height: 50px;cursor: pointer;background: #00c4c4;color: white;">선물 선택하고 후원하기</button>
								</c:if>
							</form>
						</div>
						</c:forEach>
						
					</aside>
					
				</div>
			</div>
		</div>
	</div>
</section>


<script>

$('.rewardDelete').click(function(){
	if(confirm("삭제하겠습니까?")){
		alert('아직 구현 안함')
	}
})

//이미지 확대 모달창
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
};




//후원 모달창
//Get the modal
var supportmodal = document.getElementById("myModal");
// Get the button that opens the modal
var supportbtn = document.getElementById("myBtn");
// Get the <span> element that closes the modal
var supportspan = document.getElementsByClassName("close")[0];
// When the user clicks the button, open the modal 


$('#myBtn').click(function(e){
	if($('.idSupport').val() == ""){
		console.log('후원')
		alert('로그인 해주세요');
	}
	else{
	
		if($('#myBtn').html() == '후원하기')
		supportmodal.style.display = "block";	
		else
		rewardmodal.style.display = "block";
		
	}
})

	
// When the user clicks on <span> (x), close the modal
supportspan.onclick = function() {
	supportmodal.style.display = "none";
}

var rewardmodal = document.getElementById("rewardModal");
var rewardspan = document.getElementsByClassName("close")[0];

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == supportmodal || event.target == rewardmodal) {
	  if($('#myBtn').html() == '후원하기'){
	  	supportmodal.style.display = "none";
	  }
	  else{
		rewardmodal.style.display = "none";
	  }
  }
  
};
var texts = "";
$('.rewardwrite').click(function(){
	texts = $('.rewardtext1').val()
	texts += "," + $('.rewardtext2').val() + "," +  $('.rewardtext3').val();
	$('#rewardContent').val(texts);
	
	
})




</script>
