<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="id"/>
</sec:authorize>
<style>
.previewImg {
	max-height:500px;
	display:inline-block;
	margin:10px auto;
}
.removeDiv {
    margin-right: 20px;
    margin-left: -50px;
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
     
        blogFileUpload(files,objDragAndDrop);
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
    
    function blogFileUpload(files,obj)
    {
    	console.log("blogFileupload()");
       for (var i = 0; i < files.length; i++) 
       {
            var fd = new FormData();
            fd.append('file', files[i]);
            fd.append('role','blog'); //role 설정해서 보내주자
      
            //var status = new createStatusbar(obj); //Using this we can set progress.
            //status.setFileNameSize(files[i].name,files[i].size);
            sendFileToServer(fd,status);
      
       }
    }
    
    /* 
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
    */
    function sendFileToServer(formData,status)
    {
    	console.log("sebdFileToServer()");
        var uploadURL = "<c:url value='/FileUploadToCloud'/>"; //Upload URL
        var extraData ={}; //Extra Data.
        //var token = $("meta[name='_csrf']").attr("content");
        //var header = $("meta[name='_csrf_header']").attr("content");
        var jqXHR=$.ajax({
        	/*
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
                        }, false);
                    }
                return xhrobj;
            },
            */
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
                //status.setProgress(100);
                console.log(data);
                previewImage(data.fileUrl);
                sendImgToVision(data.gcsPath);
            }
        }); 
      
        //status.setAbort(jqXHR);
    }
     
});
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
    		$.each(data.vision,function(key,value) {
    			makeTagdiv(value.label);
    		});
    	}
  	});
}

//summernote 이미지 업로드 요청
function editorUpload(file, editor)
{
	var uploadURL = "<c:url value='/FileUploadToCloud'/>";
	var form_data = new FormData();
  	form_data.append('file', file);
	form_data.append('role','editor');
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



function previewImage(src) {
	$('.previewDiv').append('<img class="previewImg" src="'+src+'" />'
	+ '<div onclick="removeImage(this)" class="removeDiv font-icon-wrapper"><i class="fa fa-fw" aria-hidden="true" title="Remove"></i></div>');
}
function removeImage(el) {
	$(el).prev().remove();
	$(el).remove();
}

//submit 이전에 호출됨
function postForm() {
    var content = $('textarea[name="content"]').val($('#summernote').summernote('code'));
    $('#post-categorie').val($('#text-categorie').val());
    $('#post-title').val($('#text-title').val());
    
    /*
    var imgObject = new Object();
    var imgArr = new Array();
    
    $('.previewImg').each(function(index,item) {    	
    	imgArr.push($(item).attr('src'));
    }
    imgObject.value = imgArr;
    
    // json 포맷으로 변환
    var values = JSON.stringify(myObject);
    */
    
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
	var isExistTag = false;
	$('.tag-button').each(function(i) {
		if($(this).html() == $.trim(tagName))
			isExistTag = true;
	});
	if(!isExistTag) {
		$('#post-tag').before('<button type="button" onclick="removeTagdiv(this);" class="tag-button mb-2 mr-2 btn btn-dashed btn-outline-primary btn-sm">'+$.trim(tagName)+'</button>');
		$('#post-tag').val('');
	}
};
var removeTagdiv = function(e) {
	e.remove();
	
}
var sendTags = function() {
	
	
}

</script>
<!--================Hero Banner Area Start =================-->
<section class="hero-banner">
	<div class="container">
	
	</div>
</section>
<!--================Hero Banner Area End =================-->
<!--================Blog Area =================-->
<section class="blog_area single-post-area area-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 posts-list">
				<div class="write-form">
					<div style="font-size:22px;border-bottom: 1px solid #ced4da;margin:0 -10px 10px -10px;padding-left: 10px;padding-bottom: 5px;">
    					<i class="fa fa-fw" aria-hidden="true"></i> 카테고리
					</div>
					<div style="font-size:22px;border-bottom: 1px solid #ced4da;margin:0 -10px 10px -10px;padding-left: 10px;padding-bottom: 10px;">
						<select id="text-categorie" class="col-lg-offset-4 col-lg-4 col-md-4 col-sm-6 form-control-lg form-control">
							<option>일러스트레이션</option>
							<option>애니메이션</option>
							<option>디자인</option>
							<option>캘리그라피</option>
							<option>조소/공예</option>
						</select>
					</div>
					<div style="font-size:22px; border-bottom: 1px solid #ced4da; margin:0 -10px 10px -10px; padding-left: 10px; padding-bottom: 5px;">
						<i class="fa fa-fw" aria-hidden="true"></i> 이미지
					</div>
					<div class="previewDiv" style="text-align: center;"></div>
					<div id="fileUpload" class="dragAndDropDiv"><span class="upload-span">여기에 파일을 드래그하세요</span></div>
					
					<div class="form-group" style="margin-top:10px;">
						<input type="text" class="form-control" id="text-title" placeholder="글제목(필수)">
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
							            	editorUpload(files[i], this);
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
							<h4 style="font-weight: bold;">누가 이 그림을 볼 수 있나요?</h4>
							<form role="form" method="post" onsubmit="postForm()" action="<c:url value='/UploadBlogPost'/>">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<div class="radio" style="padding-left: 20px; padding-top:10px;">
									<label style="font-size: 20px;">
										<input type="radio" name="accessRight" id="authRadioPublic" value="0"
										style="width:20px;height:20px;border:1px;" checked/>모두
									</label>
								</div>
								<div class="radio" style="padding-left: 20px;">
									<label style="font-size: 20px;">
										<input type="radio" name="accessRight" id="authRadioPrivate" value="1"
										style="width:20px;height:20px;border:1px;"/>구독자만
									</label>
								</div>
								<input type="hidden" class="form-control" name="categorie" id="post-categorie">
								<input type="hidden" class="form-control" name="title" id="post-title">
								<input type="hidden" class="form-control" name="imgs" id="post-imgs">
								<input type="hidden" class="form-control" name="tags" id="post-tags">
								<textarea name="content" style="display: none"></textarea>
								<input type="hidden" class="form-control" name="id" id="post-id" value="${id}"/>
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
<!--================Blog Area end =================-->
