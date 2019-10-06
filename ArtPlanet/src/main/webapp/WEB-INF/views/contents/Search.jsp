<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link href="<c:url value='/resources/search/css/style.css'/>" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="<c:url value='/resources/search/images/fav-icon.png'/>" />
<script type="application/x-javascript">
addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }
</script>
<!----webfonts---->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<!----//webfonts---->
<!-- Global CSS for the page and tiles -->
<link rel="stylesheet" href="<c:url value='/resources/search/css/main.css'/>">
<!-- //Global CSS for the page and tiles -->
<!---start-click-drop-down-menu----->
<script src="<c:url value='/resources/search/js/jquery.min.js'/>"></script>
<!-- 추가 클래스 -->
<style>
	.post-type {
		color: gray;
	}
	.post-date {
		color: darkgray;
		float: right;
	}
	.post-artist {
		vertical-align:super;
		font-weight: bold;
	}
	.post-comment {
		vertical-align: super;
		font-size: 0.8em;
	}
	
	.post-basic-info {
		padding: 10px 10px 5px;
	}
	.font-icon-wrapper {
		border: none;
		display: inline-block;
		margin-bottom: 0px;
		
	}
	.font-icon-sm i{
		font-size: 1.4em;
	}
	.portfolio_area{
		padding-top: 130px;
		padding-bottom: 0px;
	}
	#main {
		margin-top: 40px;
	}
</style>
<!---start-content---->
<div class="content">
	<div class="wrap">
		<section class="portfolio_area" id="portfolio">
				<div class="filters portfolio-filter">
					<ul>
						<li class="active" data-filter="*">전체</li>
						<li data-filter=".illustration">일러스트레이션</li>
						<li data-filter=".painting">회화</li>
						<li data-filter=".animation">애니메이션</li>
						<li data-filter=".design">디자인</li>
						<li data-filter=".calligraphy">캘리그라피</li>
						<li data-filter=".crafts">조소/공예</li>
					</ul>
				</div>
		</section>
		 <div id="main" role="main">
		      <div class="filters-content">
		      <ul id="tiles">
		        <!-- These are our grid blocks -->
		        <li onclick="location.href='<c:url value='/ViewPost'/>';">
		        	<img src="<c:url value='/resources/search/images/img1.jpg'/>" width="282" height="118">
		        	<div class="post-info">
		        		<div class="post-basic-info">
		        			<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><a href="#">그림그린그림</a></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
		        		</div>
		        	</div>
		        </li>
		        <li onclick="location.href='<c:url value='/ViewPost'/>';">
		        	<img src="<c:url value='/resources/search/images/img2.jpg'/>" width="282" height="344">
					<div class="post-info">
		        		<div class="post-basic-info">
			        		<span class="post-type">일러스트</span>
		        			<span class="post-date">30분 전</span>
			        		<h3><a href="#">그림그린그림</a></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/3.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
		        		</div>
		        	</div>
				</li>
		        <li onclick="location.href='<c:url value='/ViewPost'/>';">
		        	<img src="<c:url value='/resources/search/images/img3.jpg'/>" width="282" height="210">
		        	<div class="post-info">
		        		<div class="post-basic-info">
			        		<span class="post-type">일러스트</span>
		        			<span class="post-date">32분 전</span>
			        		<h3><a href="#">그림그린그림</a></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/4.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
		        		</div>
		        	</div>
		        </li>
		        <li onclick="location.href='<c:url value='/ViewPost'/>';">
		        	<img src="<c:url value='/resources/search/images/img4.jpg'/>" width="282" height="385">
		        	<div class="post-info">
		        		<div class="post-basic-info">
			        		<span class="post-type">일러스트</span>
		        			<span class="post-date">5시간 전</span>
			        		<h3><a href="#">그림그린그림</a></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/5.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">22</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">337</span>
		        			</div>
		        		</div>
		        	</div>
		        </li>
		        <li onclick="location.href='<c:url value='/ViewPost'/>';">
		        	<img src="<c:url value='/resources/search/images/img1.jpg'/>" width="282" height="118">
		        	<div class="post-info">
		        		<div class="post-basic-info">
		        			<span class="post-type">일러스트</span>
		        			<span class="post-date">13분 전</span>
			        		<h3><a href="#">그림그린그림</a></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/2.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
		        		</div>
		        	</div>
		        </li>
		        <li onclick="location.href='<c:url value='/ViewPost'/>';">
		        	<img src="<c:url value='/resources/search/images/img2.jpg'/>" width="282" height="344">
					<div class="post-info">
		        		<div class="post-basic-info">
			        		<span class="post-type">일러스트</span>
		        			<span class="post-date">30분 전</span>
			        		<h3><a href="#">그림그린그림</a></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/3.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
		        		</div>
		        	</div>
				</li>
		        <li onclick="location.href='<c:url value='/ViewPost'/>';">
		        	<img src="<c:url value='/resources/search/images/img3.jpg'/>" width="282" height="210">
		        	<div class="post-info">
		        		<div class="post-basic-info">
			        		<span class="post-type">일러스트</span>
		        			<span class="post-date">32분 전</span>
			        		<h3><a href="#">그림그린그림</a></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/4.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">12</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">107</span>
		        			</div>
		        		</div>
		        	</div>
		        </li>
		        <li onclick="location.href='<c:url value='/ViewPost'/>';">
		        	<img src="<c:url value='/resources/search/images/img4.jpg'/>" width="282" height="385">
		        	<div class="post-info">
		        		<div class="post-basic-info">
			        		<span class="post-type">일러스트</span>
		        			<span class="post-date">5시간 전</span>
			        		<h3><a href="#">그림그린그림</a></h3>
			        		<div class="avatar-icon-wrapper avatar-icon-sm">
			        			<div class="avatar-icon"><img src="<c:url value='/resources/kero/assets/images/avatars/5.jpg'/>"/></div>
			        		</div>
		        			<span class="post-artist">작가이름</span>
		        			<div class="clear"> </div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-comment"> </i> <span class="post-comment">22</span>
		        			</div>
		        			<div class="font-icon-wrapper font-icon-sm">
		        				<i class="pe-7s-look"> </i> <span class="post-comment">337</span>
		        			</div>
		        		</div>
		        	</div>
		        </li>
		        <!-- End of grid blocks -->
			</ul>
	        </div>
	    </div>
	</div>
</div>
<!---//End-content---->
<!----wookmark-scripts---->
  <script src="<c:url value='/resources/search/js/jquery.imagesloaded.js'/>"></script>
  <script src="<c:url value='/resources/search/js/jquery.wookmark.js'/>"></script>
  <script type="text/javascript">
    (function ($){
      var $tiles = $('#tiles'),
          $handler = $('li', $tiles),
          $main = $('#main'),
          $window = $(window),
          $document = $(document),
          options = {
            autoResize: true, // This will auto-update the layout when the browser window is resized.
            container: $main, // Optional, used for some extra CSS styling
            offset: 20, // Optional, the distance between grid items
            itemWidth:280 // Optional, the width of a grid item
          };
      /**
       * Reinitializes the wookmark handler after all images have loaded
       */
      function applyLayout() {
        $tiles.imagesLoaded(function() {
          // Destroy the old handler
          if ($handler.wookmarkInstance) {
            $handler.wookmarkInstance.clear();
          }

          // Create a new layout handler.
          $handler = $('li', $tiles);
          $handler.wookmark(options);
        });
      }
      /**
       * When scrolled all the way to the bottom, add more tiles
       */
      function onScroll() {
        // Check if we're within 100 pixels of the bottom edge of the broser window.
        var winHeight = window.innerHeight ? window.innerHeight : $window.height(), // iphone fix
            closeToBottom = ($window.scrollTop() + winHeight > $document.height() - 100);

        if (closeToBottom) {
          // Get the first then items from the grid, clone them, and add them to the bottom of the grid
          var $items = $('li', $tiles),
              $firstTen = $items.slice(0, 10);
          $tiles.append($firstTen.clone());

          applyLayout();
        }
      };

      // Call the layout function for the first time
      applyLayout();

      // Capture scroll event.
      $window.bind('scroll.wookmark', onScroll);
    })(jQuery);
  </script>
<!----//wookmark-scripts---->