<%@ page language="java" contentType="text/html;charset=euc-kr" pageEncoding="utf-8"%>
<%
    /* ============================================================================== */
    /* =   PAGE : 결과 처리 PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2013   KCP Inc.   All Rights Reserverd.                   = */
    /* ============================================================================== */
%>
<%!
    /* ============================================================================== */
    /* =   null 값을 처리하는 메소드                                                = */
    /* = -------------------------------------------------------------------------- = */
        public String f_get_parm( String val )
        {
          if ( val == null ) val = "";
          return  val;
        }
    /* ============================================================================== */
%>
<%
    /* ============================================================================== */
    /* =   01. 인증 결과                                                            = */
    /* = -------------------------------------------------------------------------- = */
    String res_cd      = f_get_parm( request.getParameter( "res_cd"      ) ); // 결과 코드
    String res_msg     = f_get_parm( request.getParameter( "res_msg"     ) ); // 결과 메시지
    /* = -------------------------------------------------------------------------- = */
    String ordr_idxx   = f_get_parm( request.getParameter( "ordr_idxx"   ) ); // 주문번호
    String buyr_name   = f_get_parm( request.getParameter( "buyr_name"   ) ); // 요청자 이름
    String card_cd     = f_get_parm( request.getParameter( "card_cd"     ) ); // 카드 코드
    String batch_key   = f_get_parm( request.getParameter( "batch_key"   ) ); // 배치 인증키
    /* ============================================================================== */


    /* ============================================================================== */
    /* =   02. 결과페이지 폼 구성                                                   = */
    /* ============================================================================== */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http:'www.w3.org/1999/xhtml" >

<head>
    <title>Art Planet-인증결과페이지</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />

	<link href="${pageContext.request.contextPath}/resources/kero/main.07a59de7b920cd76b874.css" rel="stylesheet">
</head>

<body>
    <!-- 케로UI -->
<div class="container">
   <div style="padding-top: 130px;" class="row"></div>
   <div class="row">
      <div class="inner-bar-center">
         <ul class="nav">
            <li class="nav-item"><a role="tab" data-toggle="tab"
               id="tab-nav-0" class="nav-link active" href="#tab-content-0"> <span>결과페이지</span>
            </a></li>
         </ul>
      </div>
   </div>
   <div class="row">
      <div class="col-lg-8 col-md-12">
         <div class="card-body">

            <div id="smartwizard">
               <ul class="forms-wizard">
               
                  <li><a href="#step-3"> <em>2</em><span>인증완료</span>
                  </a></li>
               </ul>
               <!-- 위자드폼 시작 -->
               <div class="form-wizard-content">
                  <div id="step-1">                 
                  </div>
                  <div id="step-2">           
                  </div>
                  <div id="step-3">
                     <div class="no-results">
                        <div class="swal2-icon swal2-success swal2-animate-success-icon">
                           <div class="swal2-success-circular-line-left"
                              style="background-color: rgb(255, 255, 255);"></div>
                           <span class="swal2-success-line-tip"></span> <span
                              class="swal2-success-line-long"></span>
                           <div class="swal2-success-ring"></div>
                           <div class="swal2-success-fix"
                              style="background-color: rgb(255, 255, 255);"></div>
                           <div class="swal2-success-circular-line-right"
                              style="background-color: rgb(255, 255, 255);"></div>
                        </div>
                        <div class="results-subtitle mt-4">Finished!</div>
                        <div class="results-title">후원자가 목표인원에 도달할 경우,</br>해당카드로 정기결제가 시작됩니다</div>
                        <div class="mt-3 mb-3"></div>
                        <div class="text-center"></div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="divider"></div>
            <div class="clearfix">
            
            <!-- form값시작 -->
    <form name="mod" method="post">
       
    
<%
    /* ============================================================================== */
    /* =   결제 결과 코드 및 메시지 출력(결과페이지에 반드시 출력해주시기 바랍니다.)= */
    /* = -------------------------------------------------------------------------- = */
    /* =   결제 정상 : res_cd값이 0000으로 설정됩니다.                              = */
    /* =   결제 실패 : res_cd값이 0000이외의 값으로 설정됩니다.                     = */
    /* = -------------------------------------------------------------------------- = */
%>	
	<!-- 처리결과 -->
<div class="main-card mb-3 card">
               <div class="card-body">
               <h5 class="card-title">처리결과</h5>
                   <table class="mb-0 table">
                       <thead>
                       <tr>
                           <th>#</th>
                           <th>Key</th>
                           <th>Value</th>                                                            
                       </tr>
                       </thead>
                       <tbody>
                         <!-- 결과 코드 -->
                       <tr>
                           <th scope="row">1</th>
                           <td>결과 코드res_cd</td>
                           <td><%=res_cd%></td>                                                           
                       </tr>
                         <!-- 결과 메시지 -->
                       <tr>
                           <th scope="row">2</th>
                           <td>결과 메세지res_msg</td>
                           <td><%=res_msg%></td>
                       </tr>                                                          
  					</tbody>
                  </table>
                </div>
<%
            /* ============================================================================== */
            /* =   1. 정상 결제시 결제 결과 출력 ( res_cd값이 0000인 경우)                  = */
            /* = -------------------------------------------------------------------------- = */
            if ( res_cd.equals("0000") )
            {
%>
			
               <div class="card-body">
               <h5 class="card-title">주문정보</h5>
                   <table class="mb-0 table">
                       <thead>
                       <tr>
                           <th>#</th>
                           <th>Key</th>
                           <th>Value</th>                                                            
                       </tr>
                       </thead>
                       <tbody>
                       <!-- 주문번호 -->
                       <tr>
                           <th scope="row">1</th>
                           <td>주문 번호ordr_idxx</td>
                           <td><%=ordr_idxx%></td>                                                           
                       </tr>
                        <!-- 주문자명 -->
                       <tr>
                           <th scope="row">2</th>
                           <td>주문자명buyr_name</td>
                           <td><%=buyr_name%></td>
                       </tr>   
                     </tbody>
                    </table>
                    </div>                   
                    <!-- 주문정보끝 -->

                     <!-- 처리결과 -->
				
                         <div class="card-body">
                         <h5 class="card-title">정기 과금 정보</h5>
                             <table class="mb-0 table">
                                 <thead>
                                 
                                 <tr>
                                     <th>#</th>
                                     <th>Key</th>
                                     <th>Value</th>                                                            
                                 </tr>
                                 </thead>
                                 <tbody>
                                 <!-- 결제 카드 -->
                                 <tr>
                                     <th scope="row">1</th>
                                     <td>인증카드코드card_cd</td>
                                     <td><%=card_cd%></td>                                                           
                                 </tr>
                                  <!-- 승인시간 -->
                                 <tr>
                                     <th scope="row">2</th>
                                     <td>배치키batch_key</td>
                                     <td><%=batch_key%></td>
                                 </tr> 
                               </tbody>        
             			       </table>
             			   </div>
             			  
                   
<%
    }
%>
                    <!-- 처음으로 이미지 버튼 -->
              
        
 </div><!-- 메인카드 -->
          <button type="button"  onclick="location.href='Home.tiles';"
                               class="btn-shadow float-right btn-wide btn-pill mr-3 btn btn-outline-secondary" >
                                             홈으로
		 					  </button>
    </div><!-- 클리어픽스 -->
 </div>

 </div><!-- col-lg-8 col-md-12 -->
      <div class="col-md-12 col-lg-4">
         <div class="main-card mb-3 card">
            <div class="card-header">공지사항</div>
            <ul class="todo-list-wrapper list-group list-group-flush">
               <li class="list-group-item">
                  <div class="todo-indicator bg-warning"></div>
                  <div class="widget-content p-0">
                     <div class="widget-content-wrapper">
                        <div class="widget-content-left mr-2"></div>
                        <div class="widget-content-left">
                           <div class="badge badge-danger ml-2">필독</div>
                           <div class="widget-heading">
                              결제건에 대한 취소관련 궁금하신점은</br>ArtPlanet으로 문의주세요

                           </div>
                           <div class="widget-subheading">
                              <i>운영자</i>
                           </div>
                        </div>

                     </div>
                  </div>
               </li>

            </ul>
            <div class="d-block text-right card-footer">

               <button class="btn btn-success btn-lg">문의하러가기</button>
            </div>
         </div>
      </div><!-- col-md-12 col-lg-4 -->
 </div><!-- row -->
 </div><!-- 컨테이너 -->
  