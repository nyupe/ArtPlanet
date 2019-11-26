<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.img-fluid{
	margin-top:20px;
}
</style>

<script>
	$(function() {
		console.log('blog는 ${blogNo}');
		//조회수 증가
		/*
		$.ajax({
			url:"<c:url value='/updateViewCount'/>",
			type:'post',
			data:{"blogNo":"<c:out value="${blogNo}"/>"},
			dataType:'json',
			success:function(data){
				console.log(data);
			}
		});
		*/
		
		var files;
		$("#input-banner").on('change', function(){
			files = this.files;
		});
		$("#changeSetting").click(function ()
		{
			 for (var i = 0; i < files.length; i++) 
		     {
				 var formData = new FormData();
				formData.append('file',files[i]);
				formData.append('role','banner'); //role 설정해서 보내주자
				formData.append('intro',$('#input-intro').val());
				formData.append('fee',$('#input-fee').val());
				formData.append('memberNo',memberNo);
		     }
			
			var uploadURL = "<c:url value='/FileUploadToCloud'/>"; //Upload URL
		    var jqXHR=$.ajax({
		        beforeSend : function(xhr)
		        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        },
		        url: uploadURL,
		        enctype:"multipart/form-data",
		        type:"POST",
		        contentType:false,
		        processData:false,
		        cache:false,
		        data:formData,
		        dataType:"json",
		        success: function(data)
		        {
		            console.log(data);
		            location.reload();
		        }
		    }); 
		});
		
		var files;
		$("#input-banner").on('change', function(){
			files = this.files;
		});
		$("#changeSetting").click(function ()
		{
			 for (var i = 0; i < files.length; i++) 
		     {
				 var formData = new FormData();
				formData.append('file',files[i]);
				formData.append('role','banner'); //role 설정해서 보내주자
				formData.append('intro',$('#input-intro').val());
				formData.append('fee',$('#input-fee').val());
				formData.append('memberNo',memberNo);
		     }
			
			var uploadURL = "<c:url value='/FileUploadToCloud'/>"; //Upload URL
		    var jqXHR=$.ajax({
		        beforeSend : function(xhr)
		        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        },
		        url: uploadURL,
		        enctype:"multipart/form-data",
		        type:"POST",
		        contentType:false,
		        processData:false,
		        cache:false,
		        data:formData,
		        dataType:"json",
		        success: function(data)
		        {
		            console.log(data);
		            location.reload();
		        }
		    }); 
		});
		
/*       댓글 관련 코드 시작                      */		
		//페이지 로드시 코멘트 목록 뿌려주기]
		showComment();
		
		//코멘트 입력및 수정처리]
		$('#commentsubmit').click(function(){
			
			if($('.idComment').val() == ""){
				alert('로그인 해주세요');
				return;
			}
			var action="<c:url value='/BlogPost/Comments'/>";
			
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
			url:"<c:url value='/BlogPost/CommentsList'/>",
			data:{blogNo:'${blogNo}','_csrf':'${_csrf.token}'},//////////////////////
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
		console.log('코멘트 목록:',data)
		var commentcounts = 0;
		var	comments="<h4 style='float: left;'>Comments</h4>&nbsp;<span class='badge badge-primary'>${commentcount}</span>"
			$.each(data,function(index,element){
				comments+="<div class='comment-list' style='clear: both;'>"
				comments+="<div class='single-comment justify-content-between d-flex'>"
				comments+="<div class='user justify-content-between d-flex'>"
				comments+="<div class='thumb'>"
				comments+="<img src='"+element['PROFILEPICTURE']+"' alt=''>"
				comments+="</div>"
				comments+="<div class='desc'>"
				comments+="<p class='comment'>"+element['REPLYCONTENT']+"</p>"
				comments+="<div class='d-flex justify-content-between'>"
				comments+="<div class='d-flex align-items-center'>"
				comments+="<h5><a href='#'>"+element['NICKNAME']+"</a></h5>"
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
			$('.fa-comments').after(commentcounts);
			$('.align-middle').after(commentcounts);
			$('.comments-area').html(comments);
			
			/*
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
			*/
	}
/*       댓글 관련 코드 끝                      */
</script>

<!--================Hero Banner Area Start =================-->
<section class="hero-banner">
	<div class="container"></div>
</section>
<!--================Hero Banner Area End =================-->
<!--================Blog Area =================-->

<section class="blog_area single-post-area area-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 posts-list">
				<div class="single-post">
					<div class="feature-img">
						<c:forEach var="image" items="${images}">
						<img style="width:100%;" class="img-fluid" src="${image.src}" alt="">
						</c:forEach>
					</div>
					<div class="blog_details">
						<h2>${title}</h2>
						<ul class="blog-info-link mt-3 mb-4">
							<li><a href="#"><i class="far fa-user"></i>${categorie}</a></li>
							<li><a href="#"><i class="far fa-comments"></i> Comments</a></li>
						</ul>
						${content}
					</div>
				</div>
				<div class="navigation-top">
					<div class="d-sm-flex justify-content-between text-center">
						<p class="comment-count">
							<span class="align-middle"><i class="far fa-comment"></i></span>
							 Comments
						</p>
						<!-- 
						<div class="col-sm-4 text-center my-2 my-sm-0">
						<p class="like-info">
							<span class="align-middle"><i class="far fa-heart"></i></span>
							Lily and 4 people like this
						</p>
						</div>
						
						<ul class="social-icons">
							<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="#"><i class="fab fa-twitter"></i></a></li>
							<li><a href="#"><i class="fab fa-dribbble"></i></a></li>
							<li><a href="#"><i class="fab fa-behance"></i></a></li>
						</ul>
						 -->
					</div>

					<div class="navigation-area">
						<div class="row">
							<div
								class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
								<div class="thumb">
									<a href="#"> <img class="img-fluid"
										src="<c:url value='/resources/img/blog/prev.jpg'/>" alt="">
									</a>
								</div>
								<div class="arrow">
									<a href="#"> <span class="lnr text-white lnr-arrow-left"></span>
									</a>
								</div>
								<div class="detials">
									<p>Prev Post</p>
									<a href="#">
										<h4>Space The Final Frontier</h4>
									</a>
								</div>
							</div>
							<div
								class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
								<div class="detials">
									<p>Next Post</p>
									<a href="#">
										<h4>Telescopes 101</h4>
									</a>
								</div>
								<div class="arrow">
									<a href="#"> <span class="lnr text-white lnr-arrow-right"></span>
									</a>
								</div>
								<div class="thumb">
									<a href="#"> <img class="img-fluid"
										src="<c:url value='/resources/img/blog/next.jpg'/>" alt="">
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="blog-author">
					<div class="media align-items-center">
						<img src="<c:url value='/resources/img/blog/author.png'/>" alt="">
						<div class="media-body">
							<a href="#">
								<h4>Harvard milan</h4>
							</a>
							<p>Second divided from form fish beast made. Every of seas
								all gathered use saying you're, he our dominion twon Second
								divided from</p>
						</div>
					</div>
				</div>

				<div class="comments-area">
					<h4>05 Comments</h4>
					<!-- 댓글 목록 -->
				</div>
				
				<div class="comment-form">
					<h4>Leave a Reply</h4>
					<form class="form-contact comment_form" action="#" id="commentForm" onsubmit="return false">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<input type="hidden" name="blogNo" value="${blogNo}"/>
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
						<c:if test="${record.id == id }">
							<button>수정</button>
							<button>삭제</button>
						</c:if>
					</form>
				</div>
				
			</div>
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget search_widget">
						<div class="menu-header-content" style="text-align: center;">
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.username" var="loginedId"/>
							<c:if test="${id eq loginedId}">
								<button type="button" style="margin-left:-30px; float:right; border:white; background-color:white; cursor:pointer;" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-fw" aria-hidden="true"></i></button>
							</c:if>
						</sec:authorize>
							<div class="avatar-icon-wrapper mb-3 avatar-icon-xxl">
								<div class="avatar-icon">
									<img src="${profilePicture}" alt="Avatar">
								</div>
							</div>
							<h3>${nickname}</h3>
							<h6>${introContent}</h6>
							<div style="text-align: center;">
								<div style="display: inline-block; margin-right: 10px;">
									<h4>3</h4>
									<h6>구독자</h6>
								</div>
								<div style="display: inline-block; margin-left: 10px;">
									<h4>￦ ${fee}</h4>
									<h6>구독료</h6>
								</div>
							</div>
						</div>
						<sec:authorize access="isAuthenticated()">
							<c:choose>
								<c:when test="${id eq loginedId}">
								<form action="<c:url value='/WritePost'/>">
									<button class="button rounded-0 primary-bg text-white w-100" type="submit">포스트 등록</button>
								</form>
								<p>블로그 주인</p>
								</c:when>
								<c:when test="${id ne loginedId}">
								<form action="<c:url value='RecurringAuthReq.do'/>">
									<input type="hidden" name="id" value="${id}"/>
									<input type="hidden" name="loginedId" value="${loginedId}"/>
									<button class="button rounded-0 primary-bg text-white w-100" type="submit">구독하기</button>
								</form>
								<p>로그인상태, 방문자</p>
								</c:when>
								<c:when test="${id ne loginedId and subscribe eq 1}">
										<button style="border:1px solid #3c3; background:#3c3;" class="button rounded-0 primary-bg text-white w-100" type="button">구독중</button>
									<p>로그인상태, 방문자, 구독중</p>
								</c:when>
							</c:choose>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<form action="<c:url value='/WritePost'/>">
								<button class="button rounded-0 primary-bg text-white w-100" type="submit">구독하기</button>
							</form>
							<p>비로그인상태</p>
						</sec:authorize>
						
					</aside>

					<aside class="single_sidebar_widget popular_post_widget">
						<h3 class="widget_title">Recent Post</h3>
						<div class="media post_item">
							<img style="width: 80px; height: 80px;"
								src="<c:url value='/resources/img/project/illustration/1.jpg'/>"
								alt="post">
							<div class="media-body">
								<a href="<c:url value='/resources/single-blog.html'/>">
									<h3>From life was you fish...</h3>
								</a>
								<p>January 12, 2019</p>
							</div>
						</div>
						<div class="media post_item">
							<img style="width: 80px; height: 80px;"
								src="<c:url value='/resources/img/project/illustration/2.jpg'/>"
								alt="post">
							<div class="media-body">
								<a href="single-blog.html">
									<h3>The Amazing Hubble</h3>
								</a>
								<p>02 Hours ago</p>
							</div>
						</div>
						<div class="media post_item">
							<img style="width: 80px; height: 80px;"
								src="<c:url value='/resources/img/project/illustration/3.jpg'/>"
								alt="post">
							<div class="media-body">
								<a href="single-blog.html">
									<h3>Astronomy Or Astrology</h3>
								</a>
								<p>03 Hours ago</p>
							</div>
						</div>
						<div class="media post_item">
							<img style="width: 80px; height: 80px;"
								src="<c:url value='/resources/img/project/illustration/4.jpg'/>"
								alt="post">
							<div class="media-body">
								<a href="single-blog.html">
									<h3>Asteroids telescope</h3>
								</a>
								<p>01 Hours ago</p>
							</div>
						</div>
					</aside>
					<aside class="single_sidebar_widget tag_cloud_widget">
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
					</aside>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">블로그 설정</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">×</span>
	                </button>
	            </div>
	            <div class="modal-body">
            		<h5>배너</h5>
            		<input id="input-banner" type="file"/>
            		<h5>소개글</h5>
            		<textarea id="input-intro" rows="1" class="form-control autosize-input" style="max-height: 200px; min-height: 38px;"></textarea>
            		<h5>구독료</h5>
            		<input id="input-fee" class="form-control input-mask-trigger" data-inputmask="'alias': 'decimal', 'groupSeparator': ',', 'autoGroup': true" im-insert="true" style="text-align: right;"/>
	                <!-- <p class="mb-0">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an
	                    unknown printer took a galley of type and scrambled.</p> -->
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	                <button id="changeSetting" type="button" class="btn btn-primary">변경사항 저장</button>
	            </div>
	        </div>
	    </div>
	</div>
</section>
<!--================Blog Area end =================-->
