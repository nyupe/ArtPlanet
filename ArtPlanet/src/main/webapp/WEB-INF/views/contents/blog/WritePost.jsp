<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function postForm() {
	    $('textarea[name="content"]').val($('#summernote').summernote('code'));
	}
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
				<div id="summernote"><p>Hello Summernote</p></div>
				<script>
					$(document).ready(function() {
					    $('#summernote').summernote({
					    	height: 400
					    });
					});
				</script>				
			</div>
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget search_widget">
						<div class="menu-header-content">
							<h4 style="font-weight: bold;">누가 이 그림을 볼 수 있나요?</h4>
							<form role="form" method="post" onsubmit="postForm()">
								<div class="radio" style="padding-left: 20px; padding-top:10px;">
									<label style="font-size: 20px;">
										<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1"
										style="width:20px;height:20px;border:1px;" checked/>모두</label>
								</div>
								<div class="radio" style="padding-left: 20px;">
									<label style="font-size: 20px;">
										<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2"
										style="width:20px;height:20px;border:1px;"/>구독자만</label>
								</div>
								<textarea name="content" style="display: none"></textarea>
								<button class="button rounded-0 primary-bg text-white w-100"
								 style="border-radius: 5px !important;" type="submit">작성 완료</button>
							</form>
						</div>						
					</aside>
				</div>
			</div>
		</div>
	</div>
</section>
<!--================Blog Area end =================-->
