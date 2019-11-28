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
.avatar-icon-sm .avatar-icon {
	border: none;
	width: 28px;
	height: 28px;
}
.font-icon-wrapper {
	font-size: 16px;
	border: none;
	margin: 0;
}
.font-icon-wrapper:hover {
	background: none;
	color: #1a1d24;
}
.font-icon-wrapper i {
	font-size: 1.5em;
}
.single_portfolio .short_info {
	bottom: 0;
	padding: 0 15px 0;
}
.dragAndDropDiv {
	border-radius: 10px;
    border: 1px dashed #888;
    width: 100%;
    height: 100px;
    color: #888;
    text-align: center;
    vertical-align: middle;
    padding: 10px 10px 10px 10px;
    font-size:200%;
    display: table;
}
.upload-span {
	display: table-cell;
	vertical-align: middle;
}
</style>
<script>

const default_img = "https://storage.googleapis.com/art-planet-storage/default/default_img.png";

$(function() {
		
	let isEnd = false;
	let isSlow = true;
       let lastScrollTop;
	
       $(window).scroll(function(){
           let $window = $(this);
           let scrollTop = $window.scrollTop();
           let windowHeight = $window.height();
           let documentHeight = $(document).height();
           
           //console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
           
           // scrollbar의 thumb가 바닥 전 50px까지 도달 하면 리스트를 가져온다.
           if( scrollTop + windowHeight + 50 > documentHeight && !isEnd && isSlow){
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
			url:"<c:url value='/getArtworkList'/>",
			type:'get',
			data:{"nowPage":nowPage},
			dataType:'json',
			success:function(data){
				console.log(data);
				if(data.length == 0) isEnd = true;
				$(data).each(function(index, item) {
					var src = item.accessRight == "0" ? item.imgUrl : default_img;
					//isotope 라이브러리 사용을 위해 객체형식으로 선언
					var $htmlString = 
						$("<div class='col-lg-3 col-md-4 all "+item.engCategorie+"'>"
							+ "<a href='<c:url value='/Blog/"+item.memberId+"/"+item.blogNo+"'/>'>"
								+ "<div class='single_portfolio'>"
									+ "<img class='img-fluid w-100' src='"+src+"' alt=''>"
									+ "<div class='short_info'>"
										+ "<span class='post-type'>"+item.categorie+"</span>"
					        			+ "<span class='post-date'>"+item.postDate+"</span>"
						        		+ "<h3><span class='post-title'>"+item.title+"</span></h3>"
						        		+ "<div class='avatar-icon-wrapper avatar-icon-sm'>"
						        			+ "<div class='avatar-icon'><img src='"+item.profile+"'/></div>"
						        		+ "</div>"
					        			+ "<span class='post-artist'>"+item.nickname+"</span>"
					        			+ "<div class='clear'> </div>"
					        			+ "<div class='font-icon-wrapper font-icon-sm'>"
					        				+ "<i class='pe-7s-comment'> </i> <span class='post-comment'>12</span>"
					        			+ "</div>"
					        			+ "<div class='font-icon-wrapper font-icon-sm'>"
					        				+ "<i class='pe-7s-look'> </i> <span class='post-comment'>107</span>"
					        			+ "</div>"
									+ "</div>"
								+ "</div>"
							+ "</a>"
						+ "</div>")
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
	
	//최초 실행시 한번 요청
	getArtworkList();
	console.log("최초요청");
		
	//이미지로 검색
	var objDragAndDrop = $(".dragAndDropDiv");
     
    $(document).on("dragenter",".dragAndDropDiv",function(e){
        e.stopPropagation();
        e.preventDefault();
        $(this).css('border', '1px solid #888');
    });
    $(document).on("dragover",".dragAndDropDiv",function(e){
        e.stopPropagation();
        e.preventDefault();
    });
    $(document).on("drop",".dragAndDropDiv",function(e){
         
        $(this).css('border', '1px dotted #888');
        e.preventDefault();
        var files = e.originalEvent.dataTransfer.files;
     
        searchFileUpload(files,objDragAndDrop);
    });
     
    $(document).on('dragenter', function (e){
        e.stopPropagation();
        e.preventDefault();
    });
    $(document).on('dragover', function (e){
      e.stopPropagation();
      e.preventDefault();
      objDragAndDrop.css('border', '1px dotted #888');
    });
    $(document).on('drop', function (e){
        e.stopPropagation();
        e.preventDefault();
    });
	    
});//$(function(){})

//이미지 검색 파일업로드
function searchFileUpload(files,obj)
{
	console.log("searchFileupload()");
   for (var i = 0; i < files.length; i++) 
   {
        var fd = new FormData();
        fd.append('file', files[i]);
        fd.append('role','search'); //role 설정해서 보내주자
        sendFileToServer(fd,status);
   }
}

function sendFileToServer(formData,status)
{
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
            sendImgToVision(data.gcsPath);
        }
    }); 
  
}
//VisionAI에 이미지분석 요청
function sendImgToVision(gcsPath)
{
	console.log("sendImgToVision()");
	$.ajax({
  		type: "GET",
    	url: "http://localhost:7070/vision/extractLabels?gcsPath="+gcsPath,
    	dataType:"json",
    	success: function(data)
    	{
    		console.log(data);
    		var tagsString;
    		$.each(data.vision,function(key,value) {
    			console.log(value.label);
    			tagsString += value.label+',';
    		});
   			$('#input-tags').val(tagsString);
   			$('#form-tags').submit();
    	}
  	});
}
</script>

<!--================ Start Portfolio Area =================-->
<section class="portfolio_area area-padding" id="portfolio">
	<div class="container">
		<div class="area-heading" style="margin-bottom: 40px;">
			<h3>당신이 <span>좋아하게 될</span> 작품을 찾아보세요.</h3>
			<p>보기 전까지는 무엇을 찾고 있는지 모릅니다.</p>
			<div class="card-body">
			    <ul class="tabs-animated-shadow tabs-animated nav">
			        <li class="nav-item">
			            <a role="tab" class="nav-link active" id="tab-c-0" data-toggle="tab" href="#tab-animated-0" aria-selected="true">
			                <span><i class="fa fa-fw" aria-hidden="true"></i></span>
			            </a>
			        </li>
			        <li class="nav-item">
			            <a role="tab" class="nav-link" id="tab-c-1" data-toggle="tab" href="#tab-animated-1" aria-selected="false">
			                <span><i class="fa fa-fw" aria-hidden="true" title="이미지로 검색하기"></i></span>
			            </a>
			        </li>
			    </ul>
			    <div class="tab-content">
			        <div class="tab-pane active" id="tab-animated-0" role="tabpanel">
						<form class="search-inner" action="<c:url value='/Search'/>">
							<input type="text" class="form-control" id="search_input" placeholder="Search Here">
							<button type="submit" class="btn"><i class="fas fa-search"></i></button>
						</form>	
			        </div>
			        <div class="tab-pane" id="tab-animated-1" role="tabpanel">
			        	<div id="fileUpload" class="dragAndDropDiv"><span class="upload-span">여기에 파일을 드래그하세요</span></div>
			        	<form id="form-tags" action="<c:url value='/Search/Artwork/Image'/>">
							<input id="input-tags" type="hidden" name="tags"/>
						</form>	
			        </div>
			    </div>
			</div>
			
		</div>
		<div class="card-header card-header-tab-animation" style="font-size: 1.8em; margin-bottom: 30px; padding: 0;">
			<ul class="nav nav-justified">
				<li class="nav-item"><a href="<c:url value='/Search/Artwork'/>" class="nav-link active">작품</a></li>
				<li class="nav-item"><a href="<c:url value='/Search/Artist'/>" class="nav-link">아티스트</a></li>
			</ul>
		</div>

		<div class="filters portfolio-filter">
			<ul id="ul_category">
				<li class="active" data-filter="*">all</li>
				<li data-filter=".illustration">일러스트레이션</li>
				<li data-filter=".animation">애니메이션</li>
				<li data-filter=".design">디자인</li>
				<li data-filter=".calligraphy">캘리그라피</li>
				<li data-filter=".crafts">조소/공예</li>
			</ul>
		</div>

		<div class="filters-content">
			<div class="row portfolio-grid"> <!-- 여기에 append -->
				<div class="grid-sizer col-md-4 col-lg-3"></div>
				<!-- 실제 콘텐츠 영역 -->
			</div>
		</div>
	</div>
</section>
<!--================ End Portfolio Area =================-->