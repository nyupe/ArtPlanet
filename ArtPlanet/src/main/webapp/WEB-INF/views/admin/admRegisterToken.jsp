<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>    
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
	$(function(){
		///ANDROID/AndIsMember.do  // url:"<c:url value='/Ajax/AjaxJson.do'/>",
		//3]AJAX사용-JSON데이타로 응답받기    
		$('#btnAjaxJson').click(function(){
			//alert('버튼 클릭까지 왔음');
			$.ajax({
				url:"<c:url value='/ANDROID/RegisterJson.do' />",
				data:$('#frm').serialize(),
				dataType:'json',
				success:successCallBack,//함수명만(()는 제외)
				error:function(request,status,error){
					console.log('응답코드:%s,에러메시지:%s,error:%s,status:%s',
								request.status,request.responseText,error,status);
				}
			});

		});////////////////btnAjaxJson	
	});
	
	function successCallBack(data){
		//alert('성공 여기까지 왔음');
		//data=JSON.parse(data);
		console.log('서버로 부터 받은 데이타:%s,키값으로 꺼내오기:%s',data,data.isToken);
		$('#lblDisplay').html(data['isToken']);// lblDisplay span태그에 출력 Y, N
	}
	</script>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>RegisterToken</title>
</head>
<body>
	<form id="frm" >
		token<input type="text" name="token" value="${param.token }" />
	</form>
	<input type="button" id="btnAjaxJson"	value="회원여부(AJAX사용-JSON으로 응답받기)" />
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <span id="lblDisplay" style="color: red; font-size: 2em; font-weight: bold">${isToken}token test</span>
</body>
</html>