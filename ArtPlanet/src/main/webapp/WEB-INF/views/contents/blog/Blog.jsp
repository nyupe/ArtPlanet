<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
.hero-banner {
	height:400px;
}
</style>
<script>
const default_img = "https://storage.googleapis.com/art-planet-storage/blog/default_img.png";
$(function(){
	console.log('${banner}');
	$(".hero-banner").css({"background":"url(${banner})"});
	
	var memberNo = "<c:out value='${memberNo}'/>";
	function getPosts(){
		$.ajax({
			url:"<c:url value='/getPosts'/>",
			type:'get',
			data:{"memberNo":memberNo},
			dataType:'json',
			success:function(data){
				console.log(data);
				if(data.length == 0)
				{
					console.log("널인데요");
					var htmlString = "<div style='text-align:center; width:100%;'><h2>등록된 글이 없어요</h2><div>";
					$('.blog_left_sidebar').append(htmlString);
				}
				$(data).each(function(index, item) {
					var src = item.accessRight == 0 ? item.images[index].src : default_img;			
					var htmlString = 
						'<article class="blog_item">'
						+ '<div class="blog_item_img">'
							+ '<a href="<c:url value="/Blog/${id}/'+item.blogNo+'"/>">'
								+ '<img class="card-img rounded-0" src="'+src+'" alt="">'
							+ '</a>'
							+ '<a href="<c:url value="/Blog/${id}/'+item.blogNo+'"/>" class="blog_item_date">'
								+ '<h3>'+item.postDate.split(' ')[2]+'</h3>'
								+ '<p>'+item.postDate.split(' ')[1]+'</p>'
							+ '</a>'
						+ '</div>'
						+ '<div class="blog_details">'
							+ '<a class="d-inline-block" href="<c:url value="/Blog/${id}/'+item.blogNo+'"/>"><h2>'+item.title+'</h2></a>'
							+ item.content
							+ '<ul class="blog-info-link">'
								+ '<li><a href="<c:url value="/Blog/${id}/'+item.blogNo+'"/>"><i class="far fa-user"></i> '+item.categorie+'</a></li>'
								+ '<li><a href="<c:url value="/Blog/${id}/'+item.blogNo+'"/>"><i class="far fa-comments"></i> 3 Comments</a></li>'
							+ '</ul>'
						+ '</div>'
					+ '</article>';
					
				$('.blog_left_sidebar').append(htmlString);
				
				});
				
			},//success()
			error:function(data){
				console.log("error");
				console.log(data);
			}
		});
	}
	
	getPosts();
	
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
	
	
});
</script>
<!--================Hero Banner Area Start =================-->
<section class="hero-banner">
    <div class="container">
		
    </div>
</section>

<!--================Hero Banner Area End =================-->
<section class="blog_area area-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 mb-5 mb-lg-0">
				<div class="blog_left_sidebar">
					<!-- 
					<nav class="blog-pagination justify-content-center d-flex">
						<ul class="pagination">
							<li class="page-item"><a href="#" class="page-link"
								aria-label="Previous"> <i class="ti-angle-left"></i>
							</a></li>
							<li class="page-item"><a href="#" class="page-link">1</a></li>
							<li class="page-item active"><a href="#" class="page-link">2</a>
							</li>
							<li class="page-item"><a href="#" class="page-link"
								aria-label="Next"> <i class="ti-angle-right"></i>
							</a></li>
						</ul>
					</nav>
					 -->
				</div>
			</div>
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget search_widget">
						<div class="menu-header-content" style="text-align: center;">
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.username" var="loginedId"/>
							<c:if test="${id eq loginedId}">
								<button type="button" style="float:right; border:white; background-color:white; cursor:pointer;" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-fw" aria-hidden="true"></i></button>
							</c:if>
						</sec:authorize>
							<div style="margin-right:-30px;" class="avatar-icon-wrapper mb-3 avatar-icon-xxl">
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
								<form action="<c:url value='/Subscribe'/>">
									<input type="hidden" name="id" value="${id}"/>
									<input type="hidden" name="loginedId" value="${loginedId}"/>
									<button class="button rounded-0 primary-bg text-white w-100" type="submit">구독하기</button>
								</form>
								<p>로그인상태, 방문자</p>
								</c:when>
							</c:choose>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<form action="<c:url value='/Login'/>">
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