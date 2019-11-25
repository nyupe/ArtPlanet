<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.card-header>.nav .nav-link:hover {
	color: #ff5555;
}
.card-header>.nav .nav-link.active {
	color: #ff5555;
}
.card-header>.nav .nav-link::before {
	background: #ff5555;
}
.single_portfolio {
	border: 1px solid #ddd;
	border-radius: 8px;
}
.single_portfolio:before {
	position: relative;
	background: none;
}
.artist-info {
	text-align: center;
}
.img-fluid {
	height: 120px;
}
.avatar-icon-lg {
	height: 0;
	margin-top: -55px;
	width: 100%;
	text-align: center;
}
.avatar-icon-lg .avatar-icon {
	display: inline-block;
	width: 80px;
	height: 80px;
}
.artist-title {
	color: #1a1d24;
	font-weight: bold;
}
.artist-post {
	width: 30%;
}
.artist-skill {
	color: #1a1d24;
	font-weight: 400;
}
.three-posts {
	min-height: 130px;
}
</style>
<script>

	const default_img = "https://storage.googleapis.com/art-planet-storage/blog/default_img.png";
	
	$(function() {
		
		let isEnd = false;
		let isSlow = true;
		
        $(window).scroll(function(){
            let $window = $(this);
            let scrollTop = $window.scrollTop();
            let windowHeight = $window.height();
            let documentHeight = $(document).height();
            
            console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
            
            // scrollbar의 thumb가 바닥 전 100px까지 도달 하면 리스트를 가져온다.
            if( scrollTop + windowHeight + 100 > documentHeight && !isEnd && isSlow){
            	isSlow = false;
                getArtworkList();
                setTimeout(function(){isSlow = true;},500)
            }
        });
		
		$('.portfolio-filter ul li').on('click', function () {
	        $('.portfolio-filter ul li').removeClass('active');
	        $(this).addClass('active');
	
	        var data = $(this).attr('data-filter');
	        $workGrid.isotope({
	            filter: data
	        });
	   	});
		//레이아웃 설정
		var $workGrid;
	    if (document.getElementById('portfolio')) {
			$workGrid = $('.portfolio-grid').isotope({
	            itemSelector: '.all',
	            percentPosition: true,
	            masonry: {
	                columnWidth: '.grid-sizer'
	            }
	        });
	    }
	    
		var nowPage = 1;

		//글 리스트 요청
		function getArtworkList(){
			$.ajax({
				url:"<c:url value='/getArtistList'/>",
				type:'get',
				data:{"nowPage":nowPage},
				dataType:'json',
				success:function(data){
					console.log(data);
					if(data.length == 0) isEnd = true;
					$(data).each(function(index, item) {
						console.log(item);
						
						var intro = item.intro != null ? item.intro : "";
						if(item.posts[2] != null)
						{
							var $htmlString = 
								$('<div class="col-lg-3 col-md-4 all'+item.engCategorie+'" style="position: absolute; left: 0%; top: 0px;">'
									+ '<div class="single_portfolio">'
										+ '<a href="#"><img class="img-fluid w-100" src="'+item.banner+'" alt=""></a>'
										+ '<div class="avatar-icon-wrapper avatar-icon-lg">'
						        			+ '<div class="avatar-icon"><a href="<c:url value="/Blog/'+item.memberId+'"/>"><img src="'+item.profile+'"></a></div>'
						        		+ '</div>'
										+ '<div class="artist-info">'
							        		+ '<h3 style="text-align: center;"><a href="<c:url value="/Blog/'+item.memberId+'"/>"><span class="artist-title">'+item.nickname+'</span></a></h3>'
							        		+ '<span class="artist-skill">'+intro+'</span>'
							        		+ '<div class="three-posts" style="text-align: center; padding-top: 5px; padding-bottom: 10px;">'
							        			+ '<a href="<c:url value="/Blog/'+item.memberId+'/'+item.posts[0].blogNo+'"/>"><img class="artist-post" src="'+item.posts[0].url+'" alt=""></a>'
							        			+ '<a href="<c:url value="/Blog/'+item.memberId+'/'+item.posts[1].blogNo+'"/>"><img class="artist-post" src="'+item.posts[1].url+'" alt=""></a>'
							        			+ '<a href="<c:url value="/Blog/'+item.memberId+'/'+item.posts[2].blogNo+'"/>"><img class="artist-post" src="'+item.posts[2].url+'" alt=""></a>'
							        		+ '</div>'
						        		+ '</div>'
					        		+ '</div>'
				        		+ '</div>');
						}
						else if(item.posts[1] != null)
						{
							var $htmlString = 
								$('<div class="col-lg-3 col-md-4 all'+item.engCategorie+'" style="position: absolute; left: 0%; top: 0px;">'
									+ '<div class="single_portfolio">'
										+ '<a href="#"><img class="img-fluid w-100" src="'+item.banner+'" alt=""></a>'
										+ '<div class="avatar-icon-wrapper avatar-icon-lg">'
						        			+ '<div class="avatar-icon"><a href="<c:url value="/Blog/'+item.memberId+'"/>"><img src="'+item.profile+'"></a></div>'
						        		+ '</div>'
										+ '<div class="artist-info">'
							        		+ '<h3 style="text-align: center;"><a href="<c:url value="/Blog/'+item.memberId+'"/>"><span class="artist-title">'+item.nickname+'</span></a></h3>'
							        		+ '<span class="artist-skill">'+intro+'</span>'
							        		+ '<div class="three-posts" style="text-align: center; padding-top: 5px; padding-bottom: 10px;">'
							        			+ '<a href="<c:url value="/Blog/'+item.memberId+'/'+item.posts[0].blogNo+'"/>"><img class="artist-post" src="'+item.posts[0].url+'" alt=""></a>'
						        				+ '<a href="<c:url value="/Blog/'+item.memberId+'/'+item.posts[1].blogNo+'"/>"><img class="artist-post" src="'+item.posts[1].url+'" alt=""></a>'
						        			+ '</div>'
						        		+ '</div>'
					        		+ '</div>'
				        		+ '</div>');
						}
						else if(item.posts[0] != null)
						{
							var $htmlString = 
								$('<div class="col-lg-3 col-md-4 all'+item.engCategorie+'" style="position: absolute; left: 0%; top: 0px;">'
									+ '<div class="single_portfolio">'
										+ '<a href="#"><img class="img-fluid w-100" src="'+item.banner+'" alt=""></a>'
										+ '<div class="avatar-icon-wrapper avatar-icon-lg">'
						        			+ '<div class="avatar-icon"><a href="<c:url value="/Blog/'+item.memberId+'"/>"><img src="'+item.profile+'"></a></div>'
						        		+ '</div>'
										+ '<div class="artist-info">'
							        		+ '<h3 style="text-align: center;"><a href="<c:url value="/Blog/'+item.memberId+'"/>"><span class="artist-title">'+item.nickname+'</span></a></h3>'
							        		+ '<span class="artist-skill">'+intro+'</span>'
							        		+ '<div class="three-posts" style="text-align: center; padding-top: 5px; padding-bottom: 10px;">'
							        			+ '<a href="<c:url value="/Blog/'+item.memberId+'/'+item.posts[0].blogNo+'"/>"><img class="artist-post" src="'+item.posts[0].url+'" alt=""></a>'
						        			+ '</div>'
						        		+ '</div>'
					        		+ '</div>'
				        		+ '</div>');
						}
						else
						{
							
							var $htmlString = 
								$('<div class="col-lg-3 col-md-4 all'+item.engCategorie+'" style="position: absolute; left: 0%; top: 0px;">'
									+ '<div class="single_portfolio">'
										+ '<a href="#"><img class="img-fluid w-100" src="'+item.banner+'" alt=""></a>'
										+ '<div class="avatar-icon-wrapper avatar-icon-lg">'
						        			+ '<div class="avatar-icon"><a href="<c:url value="/Blog/'+item.memberId+'"/>"><img src="'+item.profile+'"></a></div>'
						        		+ '</div>'
										+ '<div class="artist-info">'
							        		+ '<h3 style="text-align: center;"><a href="<c:url value="/Blog/'+item.memberId+'"/>"><span class="artist-title">'+item.nickname+'</span></a></h3>'
							        		+ '<span class="artist-skill">'+intro+'</span>'
							        		+ '<div class="three-posts" style="text-align: center; padding-top: 5px; padding-bottom: 10px;">'
						        			+ '</div>'
						        		+ '</div>'
					        		+ '</div>'
				        		+ '</div>');
						}
			        		//컨텐츠 추가 및 레이아웃 초기화
							$workGrid.append($htmlString)
							.isotope('appended', $htmlString)
							.imagesLoaded( function() {
								$workGrid.isotope('layout');
							});
					});
					console.log("nowPage:"+nowPage);
					nowPage++;
					
				},//success()
				error:function(data){
					console.log("error");
					console.log(data);
				}
			});
		}
	});
	
</script>

<!--================ Start Portfolio Area =================-->
<section class="portfolio_area area-padding" id="portfolio">
	<div class="container">
		<div class="area-heading" style="margin-bottom: 40px;">
			<h3>당신이 <span>좋아하는</span> 아티스트를 후원하세요.</h3>
			<p>이는 그들이 더 좋은 작품을 만들고 창작활동을 지속하는 원동력이 됩니다.</p>
			<form class="search-inner" action="<c:url value='/Search'/>">
				<input type="text" class="form-control" id="search_input" placeholder="Search Here">
				<button type="submit" class="btn"><i class="fas fa-search"></i></button>
			</form>
		</div>
		<div class="card-header card-header-tab-animation" style="font-size: 1.8em; margin-bottom: 30px; padding: 0;">
			<ul class="nav nav-justified">
				<li class="nav-item"><a href="<c:url value='/Search/Artwork'/>" class="nav-link">작품</a></li>
				<li class="nav-item"><a href="<c:url value='/Search/Artist'/>" class="nav-link active">아티스트</a></li>
				<li class="nav-item"><a href="<c:url value='/Search/Project'/>" class="nav-link">프로젝트</a></li>
			</ul>
		</div>

		<div class="filters portfolio-filter">
			<ul>
				<li class="active" data-filter="*">all</li>
				<li data-filter=".illustration">일러스트레이션</li>
				<li data-filter=".animation">애니메이션</li>
				<li data-filter=".design">디자인</li>
				<li data-filter=".calligraphy">캘리그라피</li>
				<li data-filter=".crafts">조소/공예</li>
			</ul>
		</div>

		<div class="filters-content">
			<div class="row portfolio-grid">
				<div class="grid-sizer col-md-4 col-lg-3"></div>
				<div class="col-lg-3 col-md-4 all illustration painting">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/banner/hero-banner.jpg'/>" alt=""></a>
						<div class="avatar-icon-wrapper avatar-icon-lg">
		        			<div class="avatar-icon"><a href="#"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></a></div>
		        		</div>
						<div class="artist-info">
			        		<h3 style="text-align: center;"><a href="#"><span class="artist-title">작가이름</span></a></h3>
			        		<span class="artist-skill">일러스트레이션, 디자인</span>
			        		<div style="text-align: center; padding-top: 5px; padding-bottom: 10px;">
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/1.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/2.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/3.jpg'/>" alt=""/></a>
			        		</div>
						</div>
					</div>
				</div>
					

				<div class="col-lg-3 col-md-4 all painting animation">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/banner/hero-banner.jpg'/>" alt=""></a>
						<div class="avatar-icon-wrapper avatar-icon-lg">
		        			<div class="avatar-icon"><a href="#"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></a></div>
		        		</div>
						<div class="artist-info">
			        		<h3 style="text-align: center;"><a href="#"><span class="artist-title">작가이름</span></a></h3>
			        		<span class="artist-skill">일러스트레이션, 디자인</span>
			        		<div style="text-align: center; padding-top: 5px; padding-bottom: 10px;">
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/1.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/2.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/3.jpg'/>" alt=""/></a>
			        		</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all design">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/banner/hero-banner.jpg'/>" alt=""></a>
						<div class="avatar-icon-wrapper avatar-icon-lg">
		        			<div class="avatar-icon"><a href="#"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></a></div>
		        		</div>
						<div class="artist-info">
			        		<h3 style="text-align: center;"><a href="#"><span class="artist-title">작가이름</span></a></h3>
			        		<span class="artist-skill">일러스트레이션, 디자인</span>
			        		<div style="text-align: center; padding-top: 5px; padding-bottom: 10px;">
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/1.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/2.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/3.jpg'/>" alt=""/></a>
			        		</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all calligraphy">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/banner/hero-banner.jpg'/>" alt=""></a>
						<div class="avatar-icon-wrapper avatar-icon-lg">
		        			<div class="avatar-icon"><a href="#"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></a></div>
		        		</div>
						<div class="artist-info">
			        		<h3 style="text-align: center;"><a href="#"><span class="artist-title">작가이름</span></a></h3>
			        		<span class="artist-skill">일러스트레이션, 디자인</span>
			        		<div style="text-align: center; padding-top: 5px; padding-bottom: 10px;">
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/1.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/2.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/3.jpg'/>" alt=""/></a>
			        		</div>
						</div>
					</div>
				</div>


				<div class="col-lg-3 col-md-4 all weeding motion fashion">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/banner/hero-banner.jpg'/>" alt=""></a>
						<div class="avatar-icon-wrapper avatar-icon-lg">
		        			<div class="avatar-icon"><a href="#"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></a></div>
		        		</div>
						<div class="artist-info">
			        		<h3 style="text-align: center;"><a href="#"><span class="artist-title">작가이름</span></a></h3>
			        		<span class="artist-skill">일러스트레이션, 디자인</span>
			        		<div style="text-align: center; padding-top: 5px; padding-bottom: 10px;">
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/1.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/2.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/3.jpg'/>" alt=""/></a>
			        		</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all fashion motion">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/banner/hero-banner.jpg'/>" alt=""></a>
						<div class="avatar-icon-wrapper avatar-icon-lg">
		        			<div class="avatar-icon"><a href="#"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></a></div>
		        		</div>
						<div class="artist-info">
			        		<h3 style="text-align: center;"><a href="#"><span class="artist-title">작가이름</span></a></h3>
			        		<span class="artist-skill">일러스트레이션, 디자인</span>
			        		<div style="text-align: center; padding-top: 5px; padding-bottom: 10px;">
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/1.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/2.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/3.jpg'/>" alt=""/></a>
			        		</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-4 all weeding motion portrait">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/banner/hero-banner.jpg'/>" alt=""></a>
						<div class="avatar-icon-wrapper avatar-icon-lg">
		        			<div class="avatar-icon"><a href="#"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></a></div>
		        		</div>
						<div class="artist-info">
			        		<h3 style="text-align: center;"><a href="#"><span class="artist-title">작가이름</span></a></h3>
			        		<span class="artist-skill">일러스트레이션, 디자인</span>
			        		<div style="text-align: center; padding-top: 5px; padding-bottom: 10px;">
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/1.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/2.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/3.jpg'/>" alt=""/></a>
			        		</div>
						</div>
					</div>
				</div>


				<div class="col-lg-3 col-md-4 all weeding motion fashion">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/banner/hero-banner.jpg'/>" alt=""></a>
						<div class="avatar-icon-wrapper avatar-icon-lg">
		        			<div class="avatar-icon"><a href="#"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></a></div>
		        		</div>
						<div class="artist-info">
			        		<h3 style="text-align: center;"><a href="#"><span class="artist-title">작가이름</span></a></h3>
			        		<span class="artist-skill">일러스트레이션, 디자인</span>
			        		<div style="text-align: center; padding-top: 5px; padding-bottom: 10px;">
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/1.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/2.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/3.jpg'/>" alt=""/></a>
			        		</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-4 all fashion motion">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/banner/hero-banner.jpg'/>" alt=""></a>
						<div class="avatar-icon-wrapper avatar-icon-lg">
		        			<div class="avatar-icon"><a href="#"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></a></div>
		        		</div>
						<div class="artist-info">
			        		<h3 style="text-align: center;"><a href="#"><span class="artist-title">작가이름</span></a></h3>
			        		<span class="artist-skill">일러스트레이션, 디자인</span>
			        		<div style="text-align: center; padding-top: 5px; padding-bottom: 10px;">
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/1.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/2.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/3.jpg'/>" alt=""/></a>
			        		</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-4 all weeding motion portrait">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/banner/hero-banner.jpg'/>" alt=""></a>
						<div class="avatar-icon-wrapper avatar-icon-lg">
		        			<div class="avatar-icon"><a href="#"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></a></div>
		        		</div>
						<div class="artist-info">
			        		<h3 style="text-align: center;"><a href="#"><span class="artist-title">작가이름</span></a></h3>
			        		<span class="artist-skill">일러스트레이션, 디자인</span>
			        		<div style="text-align: center; padding-top: 5px; padding-bottom: 10px;">
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/1.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/2.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/3.jpg'/>" alt=""/></a>
			        		</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-4 all weeding motion fashion">
					<div class="single_portfolio">
						<a href="#"><img class="img-fluid w-100" src="<c:url value='/resources/img/banner/hero-banner.jpg'/>" alt=""></a>
						<div class="avatar-icon-wrapper avatar-icon-lg">
		        			<div class="avatar-icon"><a href="#"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></a></div>
		        		</div>
						<div class="artist-info">
			        		<h3 style="text-align: center;"><a href="#"><span class="artist-title">작가이름</span></a></h3>
			        		<span class="artist-skill">일러스트레이션, 디자인</span>
			        		<div style="text-align: center; padding-top: 5px; padding-bottom: 10px;">
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/1.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/2.jpg'/>" alt=""/></a>
			        			<a href="#"><img class="artist-post" src="<c:url value='/resources/img/project/illustration/3.jpg'/>" alt=""/></a>
			        		</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</section>
<!--================ End Portfolio Area =================-->