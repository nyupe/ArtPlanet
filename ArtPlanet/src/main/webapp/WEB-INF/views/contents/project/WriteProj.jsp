<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.username" var="id"/>
<style>
.previewImg {
	max-height:300px;
	display:block;
	margin:20px auto;
}
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
	     
	        projectFileUpload(files,objDragAndDrop);
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
	     
	    function projectFileUpload(files,obj)
	    {
	       for (var i = 0; i < files.length; i++) 
	       {
	            var fd = new FormData();
	            fd.append('file', files[i]);
	            fd.append('role','project'); //role 설정해서 보내주자
	      
	            sendFileToServer(fd,status);
	      
	       }
	    }
     
	    function sendFileToServer(formData,status)
	    {
	        var uploadURL = "<c:url value='/FileUploadToCloud'/>"; //Upload URL
	        var extraData ={};
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
	                previewImage(data.fileUrl);
	                sendImgToVision(data.gcsPath);
	            },
	            error:function(data)
	            {
	            	console.log("error~~~");
	            	console.log(data);
	            }
	        });//jqXHR=$.ajax
	      
	        //status.setAbort(jqXHR);
	    }//sendFileToServer
	     
	});//ready
	

//VisionAI에 이미지 분석 요청
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
    		$.each(data.vision,function(key,value) {
    			makeTagdiv(value.label);
    		});
    	}
  	});
}
	
//summernote 이미지 업로드 요청
function projectEditorUpload(file, editor)
{
	var uploadURL = "<c:url value='/FileUploadToCloud'/>";
	var form_data = new FormData();
  	form_data.append('file', file);
	form_data.append('role','project');
  	$.ajax({
  		beforeSend : function(xhr)
        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
    	type: "POST",
    	enctype: 'multipart/form-data',
    	url: uploadURL,
    	cache: false,
    	contentType: false,
    	processData: false,
    	data: form_data,
    	dataType:"json",
    	success: function(data)
    	{
    		console.log(data);
      		$(editor).summernote('insertImage', data.fileUrl);
    	}
  	});
}

//업로드한 이미지 미리보기
function previewImage(src) {
	console.log("previmg");
	$('.previewDiv').append('<img class="previewImg" src="'+src+'" />'
	+ '<div onclick="removeImage(this)" class="removeDiv font-icon-wrapper"><i class="fa fa-fw" aria-hidden="true" title="Remove"></i></div>');
}

//업로드한 이미지 삭제
function removeImage(el){
	$(el).prev().remove();
	$(el).remove();
}





function postForm() {
	
    var contentvalue = $('textarea[name="content"]').val($('#summernote').summernote('code'));
    var titlevalue = $('#post-title').val($('#text-title').val());
    var targetvalue = $('#post-targetFigure').val($('#text-targetFigure').val().substring(2).replace(/,/g,""));
    var date = new Date($('#text-deadline').val());
	/* 날짜 변환 코드 시작 */
	var year, month, day;
    year = String(date.getFullYear());
    month = String(date.getMonth() + 1);
    if (month.length == 1) {
        month = "0" + month;
    }
    day = String(date.getDate());
    if (day.length == 1) {
        day = "0" + day;
    }
    date = year + "-" + month + "-" + day;
	$('#post-deadline').val(date);
	/* 날짜 변환 코드 끝 */
	
	var imagesJson = "{\"images\":[";
	$('.previewImg').each(function(index,item) {
		console.log($(item).attr('src'));
		imagesJson += "{\"src\":\"" + $(item).attr('src') +"\"}";
		if(index < $('.previewImg').length -1)
			imagesJson += ",";
		else
			imagesJson += "]}";
	});
	$('#post-imgs').val(imagesJson);
	
	var tagsJson = "{\"tags\":[";
	$('.tag-button').each(function(index,item) {
		console.log($(item).html());
		tagsJson += "{\"tag\":\"" + $(item).html() +"\"}";
		if(index < $('.tag-button').length -1)
			tagsJson += ",";
		else
			tagsJson += "]}";
	});
	$('#post-tags').val(tagsJson);
	
	
}
var makeTagdiv = function(tagName) {
	
	if($.trim(tagName) == '') return false;
	console.log('메이크함수')
	var isExistTag = false;
	$('.tag-button').each(function(i) {
		console.log('이건 뭐냐')
		if($(this).html() == $.trim(tagName))
			isExistTag = true;
	});
	if(!isExistTag) {
		console.log('생성')
		$('#post-tag').before('<button type="button" onclick="removeTagdiv(this);" class="tag-button mb-2 mr-2 btn btn-dashed btn-outline-primary btn-sm">'+$.trim(tagName)+'</button>');
		$('#post-tag').val('');
	}
};
var removeTagdiv = function(e) {
	console.log(e);
	e.remove();
	
}






</script>
<!--================Hero Banner Area Start =================-->
<section class="hero-banner">
	<div class="container">
	
	</div>
</section>
<!--================Hero Banner Area End =================-->
<!--================Project Area =================-->
<section class="blog_area single-post-area area-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 posts-list">
				<div class="write-form">
					<div style="font-size:22px; border-bottom: 1px solid #ced4da; margin:0 -10px 10px -10px; padding-left: 10px; padding-bottom: 5px;">
						<i class="fa fa-fw" aria-hidden="true" title="Copy to use camera"></i> 이미지
					</div>
					<div class="previewDiv" style="text-align: center;"></div>
					<div id="fileUpload" class="dragAndDropDiv"><span class="upload-span">여기에 파일을 드래그하세요</span></div>
					
					<div class="form-group" style="margin-top:10px;text-align: left;clear: both;">
						<input type="text" class="form-control" id="text-title" placeholder="글제목(필수)" >
						<input type="text" class="form-control" id="text-deadline" data-toggle="datepicker" placeholder="펀딩 마감일을 설정해주세요" style="margin: 10px 0px;"/>
						<input type="text" class="form-control input-mask-trigger" id="text-targetFigure" data-inputmask="'alias': 'numeric','groupSeparator': ',', 'autoGroup': true,  'prefix': '&#8361;&nbsp;'" placeholder="목표액을 설정해주세요" style="margin: 10px 0px"/>
						
					</div>
					<div id="summernote"></div>
					<script>
					$(document).ready(function() {
					    $('#summernote').summernote({
					    	height: 400,
					    	callbacks:
					    	{
					    		onImageUpload: function(files, editor, editable)
					    		{
						            for (var i = files.length - 1; i >= 0; i--)
						            {
						            	projectEditorUpload(files[i], this);
						            }
						        }
							}
					    });
					});
						
					</script>
					<div style="font-size:22px; border-bottom: 1px solid #ced4da; margin:10px -10px 10px -10px; padding-left: 10px; padding-bottom: 5px;">
					<i class="fa fa-fw" aria-hidden="true" title="Copy to use tags"></i> 태그
					<div class="clear"></div>
						<input type="text" class="form-control" id="post-tag" onkeypress="if( event.keyCode==13 ){makeTagdiv(this.value);}" placeholder="태그 추가.." >
					</div>
					
						
				</div>
			</div>
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget search_widget">
						<div class="menu-header-content">
							
							<form role="form" id="projectform" method="post" onsubmit="postForm()" action="<c:url value='/Search/Project/Write'/>">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<div>								
								</div>
								
								<input type="hidden" class="form-control" name="title" id="post-title">
								<input type="hidden" class="form-control" name="imgs" id="post-imgs">
								<input type="hidden" class="form-control" name="tags" id="post-tags">
								<input type="hidden" id="post-targetFigure" name="targetFigure">
								<input type="hidden" class="form-control" name="id" id="post-id" value="${id}"/>
								<input type="hidden" id="post-deadline" name="deadline" >
								<textarea name="content" style="display: none"></textarea>
								<button id="btnSubmit" class="button rounded-0 primary-bg text-white w-100"
								 style="border-radius: 5px !important;" type="submit">작성 완료</button>
							</form>
						</div>						
					</aside>
				</div>
			</div>
		</div>
	</div>
</section>
<!--================Project Area end =================-->
