<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 날짜 및 시간 -->
<script>
$(function(){
	$('#btnAddSchedule').click(function() {
		//console.log($('#datepicker').val());
		//console.log($('#timepicker').val());
		$('#scheduleList').html($('#scheduleList').html()+"<button onclick='cancelSchedule(this)' class='mb-2 mr-2 btn btn-link'>"+$('#datepicker').val()+" "+$('#timepicker').val()+"<span  class='badge badge-danger'>취소</span></button>");
	});


});	

var cancelSchedule = function(btn) {
	btn.remove();
}

	
</script>



<style>
	.scheduleDiv {
		
	}
</style>

<!-- 그림 , 입력폼 -->
<style>
.dragAndDropDiv {
    border: 1px dashed #888;
    width: 100%;
    height: 300px;
    color: #888;
    text-align: center;
    vertical-align: middle;
    padding: 10px 10px 10px 10px;
    font-size:200%;
    display: table;
}
.progressBar {
    width: 200px;
    height: 22px;
    border: 1px solid #ddd;
    border-radius: 5px; 
    overflow: hidden;
    display:inline-block;
    margin:0px 10px 5px 5px;
    vertical-align:top;
}
  
.progressBar div {
    height: 100%;
    color: #fff;
    text-align: right;
    line-height: 22px; /* same as #progressBar height if we want text middle aligned */
    width: 0;
    background-color: #0ba1b5; border-radius: 3px; 
}
.statusbar{
    border-top:1px solid #A9CCD1;
    min-height:25px;
    width:99%;
    padding:10px 10px 0px 10px;
    vertical-align:top;
}
.statusbar:nth-child(odd){
    background:#EBEFF0;
}
.filename{
    display:inline-block;
    vertical-align:top;
    width:250px;
}
.filesize{
    display:inline-block;
    vertical-align:top;
    color:#30693D;
    width:100px;
    margin-left:10px;
    margin-right:5px;
}
.abort{
    background-color:#A8352F;
    -moz-border-radius:4px;
    -webkit-border-radius:4px;
    border-radius:4px;display:inline-block;
    color:#fff;
    font-family:arial;font-size:13px;font-weight:normal;
    padding:4px 15px;
    cursor:pointer;
    vertical-align:top
}
.write-form {
	border: 1px solid #ced4da;
	padding: 10px;
}
#post-title {
	color : #1a1d24;
	font-size: 26px;
	padding-top: 1.2em;
	padding-bottom: 1.2em;
}
#post-tag {
	color : #1a1d24;
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
	margin:5px;
	font-size: 16px;
}

</style>

<div class="container">
	<div class="row">
		<div class="col-md-12" style="padding: 200px;">
			<div class="main-card mb-3 card">
			<!--================Blog Area =================-->
			
			 <div class="main-card mb-3 card">
				<div class="card-body">
					<h5 class="card-title">클래스 대해 소개해주세요</h5>           
						<section class="blog_area single-post-area area-padding" style="padding: 5px;">
							<div class="container">
								<div class="row">
									<div class="col-lg-12 posts-list">
										<div class="write-form">
											<div style="font-size:22px; border-bottom: 1px solid #ced4da; margin:0 -10px 10px -10px; padding-left: 10px; padding-bottom: 5px;">
												<i class="fa fa-fw" aria-hidden="true" title="Copy to use camera"></i> 이미지
											</div>
											<div id="fileUpload" class="dragAndDropDiv"><span class="upload-span">여기에 파일을 드래그하세요</span></div>
											
											<div class="form-group" style="margin-top:10px;">
												<input type="text" class="form-control" id="text-title" placeholder="글제목(필수)">
											</div>
											
											<div id="summernote"></div>
											<script>
												$(document).ready(function() {
												    $('#summernote').summernote({
												    	height: 400
												    });
												});
											</script>
										
												
										</div>
									</div>
								
								</div>
							</div>
						</section>

	                </div>
            	</div>		
		<!--================Blog Area end =================-->	
	
			
				<!-- 난이도  -->
				<div class="card-body">
					<div class="form-group row" style="position: relative; left: 20px;">
						<label for="inputPassword"
							class="col-sm-3 text-right col-form-label">난이도를 선택하세요</label>
						<div class="col-sm-6">
							<div class="form-check">
								<input type="radio" name="toasts" class="form-check-input"
									value="success" checked /> <label class="form-check-label"
									for="exampleRadios1"> 상 </label>
							</div>
							<div class="form-check">
								<input type="radio" name="toasts" class="form-check-input"
									value="info" checked /> <label class="form-check-label"
									for="exampleRadios1"> 중 </label>
							</div>
							<div class="form-check">
								<input type="radio" name="toasts" class="form-check-input"
									value="warning" checked /> <label class="form-check-label"
									for="exampleRadios1"> 하 </label>
							</div>
						</div>
					</div>
					<!-- 난이도 끝 -->

					<div class="card-body">

						<!-- 시간 입력 -->
						<div class="form-group row">
							<label for="inputPassword"
								class="col-sm-3 text-right col-form-label">소요시간을 입력하세요</label>
							<div class="col-sm-6">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fa fa-fw" aria-hidden="true"
												title="Copy to use hourglass-2"></i>
										</div>
									</div>
									<input class="form-control input-mask-trigger" value="시간"
										im-insert="true" style="text-align: right;"/>

								</div>

							</div>
						</div>
						<!-- 시간 입력  끝-->

						<!-- 인원 입력 -->
						<div class="form-group row">
							<label for="inputPassword"
								class="col-sm-3 text-right col-form-label">최대 인원수를 입력하세요</label>
							<div class="col-sm-6">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fa fa-fw" aria-hidden="true"
												title="Copy to use child"></i>
										</div>
									</div>
									<input class="form-control input-mask-trigger" value="명"
										im-insert="true" style="text-align: right;">

								</div>

							</div>
						</div>
						<!-- 인원 입력  끝-->

						<!-- 금액 입력 -->
						<div class="form-group row">
							<label for="inputPassword"
								class="col-sm-3 text-right col-form-label">가격을 입력하세요</label>
							<div class="col-sm-6">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i  class="fa fa-fw"
                                                aria-hidden="true"
                                                title="Copy to use krw"></i>
										</div>
									</div>
									<input class="form-control input-mask-trigger"
										data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 0, 'digitsOptional': false, 'prefix': '￦ ', 'placeholder': '0'"
										im-insert="true" style="text-align: right;">

								</div>

							</div>
						</div>
						<!-- 금액 입력  끝-->

					</div>
					<!-- 끝 -->
					<div class="main-card mb-3 card">
						<div class="card-body">
							<h5 class="card-title">시작 날짜 및 시간 설정</h5>
							<div id="scheduleList" class="col-sm-6" style=" margin: 25px; left: 210px;"></div>
							<!-- 시간 입력 -->
							
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
										<input id="datepicker" type="text"
											class="form-control" data-toggle="datepicker-icon" />
									</div>
								</div>
							</div>
							<!-- 시간 입력  끝-->

							<!-- 인원 입력 -->
							<div class="form-group row">
								<label for="inputPassword"
									class="col-sm-3 text-right col-form-label">시작시간을 선택하세요</label>
								<div class="col-sm-6">
									<div class="input-group">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i   class="fa fa-fw"
                                                    aria-hidden="true"
                                                     title="Copy to use clock-o"></i>
											</div>
										</div>
										<select class="form-control" id="timepicker">
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
								<button id="btnAddSchedule" type="button" class="mb-2 mr-2 btn btn-success">추가</button>

							</div>
	                                
							<!-- 날짜 입력 끝  -->
							<!-- 인원 입력  끝-->
						</div>
					</div>
				</div>

             <!-- 맵  -->
			 <div class="main-card mb-3 card">
				<div class="card-body">
					<h5 class="card-title">클래스 위치 입력해주세요</h5>            
					 
					 <div class="map_wrap">
					    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
					    <div id="menu_wrap" class="bg_white">
					        <div class="option">
					            <div>
					                <form onsubmit="searchPlaces(); return false;">
					                    키워드 : <input type="text" value="클래스 위치" id="keyword" size="15"> 
					                    <button type="submit">검색하기</button> 
					                </form>
					            </div>
					        </div>
					        <hr>
					        <ul id="placesList"></ul>
					        <div id="pagination"></div>
					    </div>
					</div>
					
		<!-- 주소 입력 -->
				 <div class="main-card mb-6 card">
                        <div class="card-body">
                        	<div class="col-sm-8">
                        <h5 class="card-title">클래스 주소</h5>
                            
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <button class="btn btn-secondary">클래스 주소
                                        </button>
                                    </div>
                                    <input id="classAddr" type="text" class="form-control">
                                </div>
                                <br>
                                
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <button id="secondadd" class="btn btn-secondary">상세주소
                                        </button>
                                        </div>
                                        <input id="detailAddr" type="text" class="form-control">
                                    </div> 
                                </div>
                            </div>
						</div>
		           </div>
				</div>
			
<!-- 맵 끝 -->
				  
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=507d9a5016712739e50d9d8c9ef33fd9&libraries=services"></script>
  
  
  
 <!--  카카오맵 CSS  --> 
  <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
<!--  카카오맵 끝 CSS -->



<!-- 카카오맵  -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=507d9a5016712739e50d9d8c9ef33fd9&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
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
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

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

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
            
            itemEl.onclick = function() {
            	document.getElementById('classAddr').value = $(this).find('div').find('span:first').html();
            	$('#detailAddr').focus();
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

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
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

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>

<!-- 카카오맵 끝  -->

<!-- 그림 및 입력폼 -->
<script type="text/javascript">
$(document).ready(function(){
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
     
        handleFileUpload(files,objDragAndDrop);
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
     
    function handleFileUpload(files,obj)
    {
       for (var i = 0; i < files.length; i++) 
       {
            var fd = new FormData();
            fd.append('file', files[i]);
      
            var status = new createStatusbar(obj); //Using this we can set progress.
            status.setFileNameSize(files[i].name,files[i].size);
            sendFileToServer(fd,status);
      
       }
    }
     
    var rowCount=0;
    function createStatusbar(obj){
             
        rowCount++;
        var row="odd";
        if(rowCount %2 ==0) row ="even";
        this.statusbar = $("<div class='statusbar "+row+"'></div>");
        this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
        this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
        this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
        this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
         
        obj.after(this.statusbar);
      
        this.setFileNameSize = function(name,size){
            var sizeStr="";
            var sizeKB = size/1024;
            if(parseInt(sizeKB) > 1024){
                var sizeMB = sizeKB/1024;
                sizeStr = sizeMB.toFixed(2)+" MB";
            }else{
                sizeStr = sizeKB.toFixed(2)+" KB";
            }
      
            this.filename.html(name);
            this.size.html(sizeStr);
        }
         
        this.setProgress = function(progress){       
            var progressBarWidth =progress*this.progressBar.width()/ 100;  
            this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
            if(parseInt(progress) >= 100)
            {
                this.abort.hide();
            }
        }
         
        this.setAbort = function(jqxhr){
            var sb = this.statusbar;
            this.abort.click(function()
            {
                jqxhr.abort();
                sb.hide();
            });
        }
    }
     
    function sendFileToServer(formData,status)
    {
        var uploadURL = "<c:url value='/FileUpload'/>"; //Upload URL
        var extraData ={}; //Extra Data.
        var jqXHR=$.ajax({
                xhr: function() {
                var xhrobj = $.ajaxSettings.xhr();
                if (xhrobj.upload) {
                        xhrobj.upload.addEventListener('progress', function(event) {
                            var percent = 0;
                            var position = event.loaded || event.position;
                            var total = event.total;
                            if (event.lengthComputable) {
                                percent = Math.ceil(position / total * 100);
                            }
                            //Set progress
                            status.setProgress(percent);
                            console.log('status.setProgress(percent)');
                        }, false);
                    }
                return xhrobj;
            },
            url: uploadURL,
            type: "POST",
            contentType:false,
            processData: false,
            cache: false,
            data: formData,
            success: function(data){
                status.setProgress(100);
                console.log(data);
                previewImage(data);
                
                //$("#status1").append("File upload Done<br>");           
            }
        }); 
      
        status.setAbort(jqXHR);
    }
     
});
function previewImage(filename) {
	$('.dragAndDropDiv').before('<img src="D:/fileupload-test/'+filename+'" />');
}

function postForm() {
    var content = $('textarea[name="content"]').val($('#summernote').summernote('code'));
    $('#post-title').val($('#text-title').val());
    console.log(content.val());
}
var makeTagdiv = function() {
	if($('#post-tag').val().trim() == '') return false;
	var isExistTag = false;
	$('.tag-button').each(function(i) {
		if($(this).html() == $('#post-tag').val().trim())
			isExistTag = true;
	});
	if(!isExistTag) {
		$('#post-tag').before('<button type="button" onclick="removeTagdiv(this);" class="tag-button mb-2 mr-2 btn btn-dashed btn-outline-primary btn-sm">'+$('#post-tag').val().trim()+'</button>');
		$('#post-tag').val('');
	}
};
var removeTagdiv = function(e) {
	console.log(e);
	e.remove();
	
}
</script>

