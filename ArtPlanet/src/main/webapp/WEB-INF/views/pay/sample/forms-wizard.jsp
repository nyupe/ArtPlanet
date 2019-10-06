<%@ page language="java" contentType="text/html;charset=euc-kr" pageEncoding="utf-8"%>
<%@ include file="../cfg/site_conf_inc.jsp" %>
<% request.setCharacterEncoding ("utf-8"); %>
<% response.setContentType("text/html;charset=utf-8"); %>

<!doctype html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="ko">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>order</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
    />
    <meta name="description" content="order">
    <link rel="icon" href="favicon.ico">

    <!-- Disable tap highlight on IE -->
    <meta name="msapplication-tap-highlight" content="no">

<link href="${pageContext.request.contextPath}/resources/kero/main.07a59de7b920cd76b874.css" rel="stylesheet"></head>
<script type="text/javascript">
	function m_Completepayment( FormOrJson, closeEvent ) 
    {
        var frm = document.order_info; 
        GetField( frm, FormOrJson ); 
        
        if( frm.res_cd.value == "0000" )
        {
		    alert("결제 승인 요청 전,\n\n반드시 결제창에서 고객님이 결제 인증 완료 후\n\n리턴 받은 ordr_chk 와 업체 측 주문정보를\n\n다시 한번 검증 후 결제 승인 요청하시기 바랍니다."); 
            frm.submit(); 
        }
        else
        {
            alert( "[" + frm.res_cd.value + "] " + frm.res_msg.value );
            
            closeEvent();
        }
    }
	</script>
	
	<script type="text/javascript" src="<%= g_conf_js_url %>"></script>
  <script type="text/javascript">
        function jsf__pay( form )
        {
            try
            {
                KCP_Pay_Execute( form ); 
            }
            catch (e)
            {
            
            }
        }             

    
        function init_orderid()
        {
            var today = new Date();
            var year  = today.getFullYear();
            var month = today.getMonth() + 1;
            var date  = today.getDate();
            var time  = today.getTime();

            if(parseInt(month) < 10) {
                month = "0" + month;
            }

            if(parseInt(date) < 10) {
                date = "0" + date;
            }

            var order_idxx = "TEST" + year + "" + month + "" + date + "" + time;

            document.order_info.ordr_idxx.value = order_idxx;            
        }
       
    </script>
<body>
<div class="app-container app-theme-gray">
        <div class="app-main">
   
        <div class="app-sidebar-overlay d-none animated fadeIn"></div>
        <div class="app-main__outer">
        <div class="app-main__inner">
        <div class="header-mobile-wrapper">
     
        </div>
        <div class="app-header">
            <div class="page-title-heading">
                ArtClass 주문페이지
                <div class="page-title-subheading">
          주문페이지
                </div>
            </div>
            <!-- 筌��ㅿ옙占쎌�놂옙占쏙���占썽�븝옙 占쏙옙占쏙옙 -->
            <div class="app-header-right">
                <div class="search-wrapper">
                    <i class="search-icon-wrapper typcn typcn-zoom-outline"></i>
                    <input type="text" placeholder="Search...">
                </div>
                <div class="header-btn-lg pr-0">
                    <div class="header-dots">
                        <div class="dropdown">
                            <button type="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown" class="p-0 mr-2 btn btn-link">
                                <i class="typcn typcn-th-large-outline"></i>
                            </button>
                            <div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu-xl rm-pointers dropdown-menu dropdown-menu-right">
                                <div class="dropdown-menu-header">
                                    <div class="dropdown-menu-header-inner bg-vicious-stance">
                                        <div class="menu-header-image opacity-4" style="background-image: url('assets/images/dropdown-header/city5.jpg');"></div>
                                        <div class="menu-header-content text-white">
                                            <h5 class="menu-header-title">Grid Dashboard</h5>
                                            <h6 class="menu-header-subtitle">Easy grid navigation inside dropdowns</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="grid-menu grid-menu-xl grid-menu-3col">
                                    <div class="no-gutters row">
                                    <!-- 占쎄�瑜� 占쏙옙占쏙옙 占쏙옙燁삼옙獄�占� 占썬�삘�⑨���占쏙옙��占쏙옙 占쏙옙�깍옙  -->
                                       
                                    </div>
                                </div>
                                <ul class="nav flex-column">
                                    <li class="nav-item-divider nav-item"></li>
                                    <li class="nav-item-btn text-center nav-item">
                                        <button class="btn-shadow btn btn-primary btn-sm">Follow-ups</button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="dropdown">
                            <button type="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown" class="p-0 btn btn-link">
                                <i class="typcn typcn-bell"></i>
                                <span class="badge badge-dot badge-dot-sm badge-danger">Notifications</span>
                            </button>
                            <div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu-xl rm-pointers dropdown-menu dropdown-menu-right">
                                <div class="dropdown-menu-header mb-0">
                                    <div class="dropdown-menu-header-inner bg-night-sky">
                                        <div class="menu-header-image opacity-5" style="background-image: url('assets/images/dropdown-header/city2.jpg');"></div>
                                        <div class="menu-header-content text-light">
                                            <h5 class="menu-header-title">Notifications</h5>
                                            <h6 class="menu-header-subtitle">You have <b>21</b> unread messages</h6>
                                        </div>
                                    </div>
                                </div>
                                <ul class="tabs-animated-shadow tabs-animated nav nav-justified tabs-shadow-bordered p-3">
                                    <li class="nav-item">
                                        <a role="tab" class="nav-link active" data-toggle="tab" href="#tab-messages-header">
                                            <span>Messages</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a role="tab" class="nav-link" data-toggle="tab" href="#tab-events-header">
                                            <span>Events</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a role="tab" class="nav-link" data-toggle="tab" href="#tab-errors-header">
                                            <span>System</span>
                                        </a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab-messages-header" role="tabpanel">
                                        <div class="scroll-area-sm">
                                            <div class="scrollbar-container">
                                                <div class="p-3">
                                                    <div class="notifications-box">
                                                        <div class="vertical-time-simple vertical-without-time vertical-timeline vertical-timeline--one-column">
                                                            <div class="vertical-timeline-item dot-danger vertical-timeline-element">
                                                                <div><span class="vertical-timeline-element-icon bounce-in"></span>
                                                                    <div class="vertical-timeline-element-content bounce-in"><h4 class="timeline-title">All Hands Meeting</h4><span class="vertical-timeline-element-date"></span></div>
                                                                </div>
                                                            </div>
                                                            <div class="vertical-timeline-item dot-warning vertical-timeline-element">
                                                                <div><span class="vertical-timeline-element-icon bounce-in"></span>
                                                                    <div class="vertical-timeline-element-content bounce-in"><p>Yet another one, at <span class="text-success">15:00 PM</span></p><span class="vertical-timeline-element-date"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="vertical-timeline-item dot-success vertical-timeline-element">
                                                                <div><span class="vertical-timeline-element-icon bounce-in"></span>
                                                                    <div class="vertical-timeline-element-content bounce-in">
                                                                        <h4 class="timeline-title">Build the production release
                                                                            <span class="badge badge-danger ml-2">NEW</span>
                                                                        </h4>
                                                                        <span class="vertical-timeline-element-date"></span></div>
                                                                </div>
                                                            </div>
                                                            <div class="vertical-timeline-item dot-primary vertical-timeline-element">
                                                                <div><span class="vertical-timeline-element-icon bounce-in"></span>
                                                                    <div class="vertical-timeline-element-content bounce-in">
                                                                        <h4 class="timeline-title">Something not important
                                                                            <div class="avatar-wrapper mt-2 avatar-wrapper-overlap">
                                                                                <div class="avatar-icon-wrapper avatar-icon-sm">
                                                                                    <div class="avatar-icon"><img
                                                                                            src="assets/images/avatars/1.jpg"
                                                                                            alt=""></div>
                                                                                </div>
                                                                                <div class="avatar-icon-wrapper avatar-icon-sm">
                                                                                    <div class="avatar-icon"><img
                                                                                            src="assets/images/avatars/2.jpg"
                                                                                            alt=""></div>
                                                                                </div>
                                                                                <div class="avatar-icon-wrapper avatar-icon-sm">
                                                                                    <div class="avatar-icon"><img
                                                                                            src="assets/images/avatars/3.jpg"
                                                                                            alt=""></div>
                                                                                </div>
                                                                                <div class="avatar-icon-wrapper avatar-icon-sm">
                                                                                    <div class="avatar-icon"><img
                                                                                            src="assets/images/avatars/4.jpg"
                                                                                            alt=""></div>
                                                                                </div>
                                                                                <div class="avatar-icon-wrapper avatar-icon-sm">
                                                                                    <div class="avatar-icon"><img
                                                                                            src="assets/images/avatars/5.jpg"
                                                                                            alt=""></div>
                                                                                </div>
                                                                                <div class="avatar-icon-wrapper avatar-icon-sm">
                                                                                    <div class="avatar-icon"><img
                                                                                            src="assets/images/avatars/9.jpg"
                                                                                            alt=""></div>
                                                                                </div>
                                                                                <div class="avatar-icon-wrapper avatar-icon-sm">
                                                                                    <div class="avatar-icon"><img
                                                                                            src="assets/images/avatars/7.jpg"
                                                                                            alt=""></div>
                                                                                </div>
                                                                                <div class="avatar-icon-wrapper avatar-icon-sm">
                                                                                    <div class="avatar-icon"><img
                                                                                            src="assets/images/avatars/8.jpg"
                                                                                            alt=""></div>
                                                                                </div>
                                                                                <div class="avatar-icon-wrapper avatar-icon-sm avatar-icon-add">
                                                                                    <div class="avatar-icon"><i>+</i></div>
                                                                                </div>
                                                                            </div>
                                                                        </h4>
                                                                        <span class="vertical-timeline-element-date"></span></div>
                                                                </div>
                                                            </div>
                                                            <div class="vertical-timeline-item dot-info vertical-timeline-element">
                                                                <div><span class="vertical-timeline-element-icon bounce-in"></span>
                                                                    <div class="vertical-timeline-element-content bounce-in"><h4 class="timeline-title">This dot has an info state</h4><span class="vertical-timeline-element-date"></span></div>
                                                                </div>
                                                            </div>
                                                            <div class="vertical-timeline-item dot-danger vertical-timeline-element">
                                                                <div><span class="vertical-timeline-element-icon bounce-in"></span>
                                                                    <div class="vertical-timeline-element-content bounce-in"><h4 class="timeline-title">All Hands Meeting</h4><span class="vertical-timeline-element-date"></span></div>
                                                                </div>
                                                            </div>
                                                            <div class="vertical-timeline-item dot-warning vertical-timeline-element">
                                                                <div><span class="vertical-timeline-element-icon bounce-in"></span>
                                                                    <div class="vertical-timeline-element-content bounce-in"><p>Yet another one, at <span class="text-success">15:00 PM</span></p><span class="vertical-timeline-element-date"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="vertical-timeline-item dot-success vertical-timeline-element">
                                                                <div><span class="vertical-timeline-element-icon bounce-in"></span>
                                                                    <div class="vertical-timeline-element-content bounce-in">
                                                                        <h4 class="timeline-title">Build the production release
                                                                            <span class="badge badge-danger ml-2">NEW</span>
                                                                        </h4>
                                                                        <span class="vertical-timeline-element-date"></span></div>
                                                                </div>
                                                            </div>
                                                            <div class="vertical-timeline-item dot-dark vertical-timeline-element">
                                                                <div><span class="vertical-timeline-element-icon bounce-in"></span>
                                                                    <div class="vertical-timeline-element-content bounce-in"><h4 class="timeline-title">This dot has a dark state</h4><span class="vertical-timeline-element-date"></span></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab-events-header" role="tabpanel">
                                        <div class="scroll-area-sm">
                                            <div class="scrollbar-container">
                                              
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab-errors-header" role="tabpanel">
                                        <div class="scroll-area-sm">
                                            <div class="scrollbar-container">
                                                <div class="no-results pt-3 pb-0">
                                                    <div class="swal2-icon swal2-success swal2-animate-success-icon">
                                                        <div class="swal2-success-circular-line-left" style="background-color: rgb(255, 255, 255);"></div>
                                                        <span class="swal2-success-line-tip"></span>
                                                        <span class="swal2-success-line-long"></span>
                                                        <div class="swal2-success-ring"></div>
                                                        <div class="swal2-success-fix" style="background-color: rgb(255, 255, 255);"></div>
                                                        <div class="swal2-success-circular-line-right" style="background-color: rgb(255, 255, 255);"></div>
                                                    </div>
                                                    <div class="results-subtitle">All caught up!</div>
                                                    <div class="results-title">There are no system errors!</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <ul class="nav flex-column">
                                    <li class="nav-item-divider nav-item"></li>
                                    <li class="nav-item-btn text-center nav-item">
                                        <button class="btn-shadow btn-wide btn-pill btn btn-focus btn-sm">View Latest Changes</button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="header-btn-lg pr-0">
                    <div class="widget-content p-0">
                        <div class="widget-content-wrapper">
                            <div class="widget-content-left">
                                <div class="btn-group">
                                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="p-0 btn">
                                        <img width="42" class="rounded" src="assets/images/avatars/3.jpg" alt="">
                                        <i class="fa fa-angle-down ml-2 opacity-8"></i>
                                    </a>
                                    <div tabindex="-1" role="menu" aria-hidden="true" class="rm-pointers dropdown-menu-lg dropdown-menu dropdown-menu-right">
                                        <div class="dropdown-menu-header">
                                            <div class="dropdown-menu-header-inner bg-info">
                                                <div class="menu-header-image opacity-2" style="background-image: url('assets/images/dropdown-header/city1.jpg');"></div>
                                                <div class="menu-header-content text-left">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-wrapper">
                                                            <div class="widget-content-left mr-3">
                                                                <img width="42" class="rounded-circle"
                                                                     src="assets/images/avatars/3.jpg"
                                                                     alt="">
                                                            </div>
                                                            <div class="widget-content-left">
                                                                <div class="widget-heading">Minnie Betts
                                                                </div>
                                                                <div class="widget-subheading opacity-8">A short profile description
                                                                </div>
                                                            </div>
                                                            <div class="widget-content-right mr-2">
                                                                <button class="btn-pill btn-shadow btn-shine btn btn-focus">Logout
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="scroll-area-xs" style="height: 150px;">
                                            <div class="scrollbar-container ps">
                                                <ul class="nav flex-column">
                                                    <li class="nav-item-header nav-item">Activity
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">Chat
                                                            <div class="ml-auto badge badge-pill badge-info">8
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">Recover Password
                                                        </a>
                                                    </li>
                                                    <li class="nav-item-header nav-item">My Account
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">Settings
                                                            <div class="ml-auto badge badge-success">New
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">Messages
                                                            <div class="ml-auto badge badge-warning">512
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="javascript:void(0);" class="nav-link">Logs
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <ul class="nav flex-column">
                                            <li class="nav-item-divider mb-0 nav-item"></li>
                                        </ul>
                                        <div class="grid-menu grid-menu-2col">
                                            <div class="no-gutters row">
                                                <div class="col-sm-6">
                                                    <button class="btn-icon-vertical btn-transition btn-transition-alt pt-2 pb-2 btn btn-outline-warning">
                                                        <i class="pe-7s-chat icon-gradient bg-amy-crisp btn-icon-wrapper mb-2"></i>
                                                        Message Inbox
                                                    </button>
                                                </div>
                                                <div class="col-sm-6">
                                                    <button class="btn-icon-vertical btn-transition btn-transition-alt pt-2 pb-2 btn btn-outline-danger">
                                                        <i class="pe-7s-ticket icon-gradient bg-love-kiss btn-icon-wrapper mb-2"></i>
                                                        <b>Support Tickets</b>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <ul class="nav flex-column">
                                            <li class="nav-item-divider nav-item">
                                            </li>
                                            <li class="nav-item-btn text-center nav-item">
                                                <button class="btn-wide btn btn-primary btn-sm">
                                                    Open Messages
                                                </button>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>    </div>
            <div class="app-header-overlay d-none animated fadeIn"></div>
        </div>
            <div class="app-inner-layout app-inner-layout-page">
               
                   
                    <!-- 占쏙옙占쏙옙 占쏙옙占쏙옙�븝옙�븝옙 -->
                    <div class="inner-bar-center">
                        <ul class="nav">
                            <li class="nav-item">
                                <a role="tab" data-toggle="tab" id="tab-nav-0" class="nav-link active"
                                   href="#tab-content-0">
                                    <span>Wizard I</span>
                                </a>
                            </li>
                         	<!-- 占쏙옙占쏙옙占썬�쇽옙占� 占쏙옙占쏙옙 -->
                        </ul>
                	</div>
                </div>
                <div class="app-inner-layout__wrapper">
                    <div class="app-inner-layout__content">
                        <div class="tab-content">
                        <div class="tab-pane tabs-animation fade show active" id="tab-content-0" role="tabpanel">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-lg-8 col-md-12">
                                        <div class="main-card mb-3 card">
                                            <div class="card-body">
    
                                                <div id="smartwizard">
                                                    <ul class="forms-wizard">
                                                        <li>
                                                            <a href="#step-1">
                                                                <em>1</em><span>주소 정보</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#step-2">
                                                                <em>2</em><span>결제 정보</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#step-3">
                                                                <em>3</em><span>완료</span>
                                                            </a>
                                                        </li>
                                                    </ul>
    
                                                    <div class="form-wizard-content">
                                                        <div id="step-1">
                                                            <div class="form-row">
                                                                <div class="col-md-6">
                                                                   
                                                                </div>
                                                                <div class="col-md-6">
                                                                   
                                                                </div>
                                                            </div>
                                                            <div class="position-relative form-group"><label
                                                                    for="exampleAddress">주소</label><input
                                                                    name="address" id="exampleAddress"
                                                                    placeholder="예시)서울특별시 금천구 가산로11" type="text"
                                                                    class="form-control"></div>
                                                            <div class="position-relative form-group"><label
                                                                    for="exampleAddress2">상세주소</label><input
                                                                    name="address2" id="exampleAddress2"
                                                                    placeholder="예시)4층 한국소프트인재개발원" type="text"
                                                                    class="form-control">
                                                            </div>
                                                            <div class="form-row">
                                                                <div class="col-md-6">
                                                                    <div class="position-relative form-group"><label
                                                                            for="exampleCity">우편번호</label><input name="city"
                                                                                                                 id="exampleCity"
                                                                                                                 type="text"
                                                                                                                 class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <div class="position-relative form-group"><label
                                                                            for="exampleState">여분용1</label><input
                                                                            name="state" id="exampleState" type="text"
                                                                            class="form-control"></div>
                                                                </div>
                                                                <div class="col-md-2">
                                                                    <div class="position-relative form-group"><label
                                                                            for="exampleZip">여분용2</label><input name="zip"
                                                                                                               id="exampleZip"
                                                                                                               type="text"
                                                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="position-relative form-check"><input name="check"
                                                                                                             id="exampleCheck"
                                                                                                             type="checkbox"
                                                                                                             class="form-check-input"><label
                                                                    for="exampleCheck" class="form-check-label">Check me
                                                                out</label>
                                                            </div>
                                                        </div>
                                                        <div id="step-2">
                                                            <div id="accordion" class="accordion-wrapper mb-3">
                                                                <div class="card">
                                                                    <div id="headingOne" class="card-header">
                                                                        <button type="button" data-toggle="collapse"
                                                                                data-target="#collapseOne"
                                                                                aria-expanded="false"
                                                                                aria-controls="collapseOne"
                                                                                class="text-left m-0 p-0 btn btn-link btn-block">
                                                                                <!-- STEP2 입력폼 -->
                                                                            <span class="form-heading">결제정보<p>Enter your user informations below</p></span>
                                                                        </button>
                                                                    </div>
                                                                    <div data-parent="#accordion" id="collapseOne"
                                                                         aria-labelledby="headingOne" class="collapse show">
                                                                        <div class="card-body">
                                                                        	<!-- PG사로 폼값 포스트로 전송하기 -->
																		<form name="order_info" method="post" action="Hub.do" >
                                                                            <div class="form-row">
                                                                            <div class="col-md-6">
                                                                            	   <label >지불방법</label>
                                                                           <select class="multiselect-dropdown form-control" name="pay_method">
					                                                            <optgroup label="pay_method">
					                                                               <option value="100000000000">신용카드</option>
													                                <option value="010000000000">계좌이체</option>
													                                <option value="001000000000">가상계좌</option>
													                                <option value="000100000000">포인트</option>
													                                <option value="000010000000">휴대폰</option>
													                                <option value="000000001000">상품권</option>
													                                <option value="000000000010">ARS</option>
													                                <option value="111000000000">신용카드/계좌이체/가상계좌</option>
					                                                            </optgroup>
																			</select>
                                                          					  
                                                                            
                                                                            </div>
                                                                            
                                                                                <div class="col-md-6">
                                                                                    <div class="position-relative form-group">
                                                                                        <label >주문번호</label>
                                                                                       
                                                                                        <input  class="form-control" placeholder="with a placeholder" type="text" name="ordr_idxx" value="TEST1234" maxlength="40" />
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                    <div class="position-relative form-group">
                                                                                        <label>상품명</label>
                                                                                       <input class="form-control" type="text" name="good_name"  value="강좌결제테스트상품 "/>
                                                                                    </div>
                                                                                </div>
                                                         						
                                                         						 <div class="col-md-6">
                                                                                    <div class="position-relative form-group">
                                                                                        <label>주문자명</label>
                                                                                       <input class="form-control" type="text" name="buyr_name"  value="주문자명"/>
                                                                                    </div>
                                                                                </div>
                                                                                
                                                                            </div>
                                                                            <div class="position-relative form-group">
                                                                                <label>결제금액</label>
                                                                              
                                                                                <input  class="form-control" type="text" name="good_mny"  value="1004" maxlength="9"/>원(숫자만 입력)    
                                                                             </div>
                                                                      
                                                                              <div class="form-group">
                                                                					<label for="email">Email</label>
                                                              				  	<div>
                                                                			    	<input type="text" class="form-control" id="email"
                                                                          			 name="buyr_mail" placeholder="Email"/>
                                                               				 	</div>
                                                         				   </div>
                                                         				   
                                                                            <div class="position-relative form-group">
                                                                            	<label>전화번호</label>
 																				<input	value="02-0000-0000"
                                            													name="buyr_tel1"
                                                                                                placeholder="02-0000-1234"
                                                                                                type="text"
                                                                                                class="form-control">
                                                                             </div>
                                                                             
                                                                             <div class="position-relative form-group">
                                                                            	<label>휴대폰번호</label>
 																				<input value="010-0000-0000"
                                            													name="buyr_tel2"
                                                                                                placeholder="010-0000-1234"
                                                                                                type="text"
                                                                                                class="form-control">
                                                                             </div>
                                                                             
                                                                             <!-- 결제요청 버튼 
									<input name="button" type="button" class="submit" value="결제요청" onclick="jsf__pay(this.form);"/>-->
									 <button type="button"  
                                                            class="btn-shadow btn-wide float-right btn-pill btn-hover-shine btn btn-primary"
                                                            onclick="jsf__pay(this.form);">
                                                        Pay
                                  </button>
									
     							    <!-- 히든타입 가맹점정보 -->
     							    <input type="hidden" name="req_tx"          value="pay" />
    								<input type="hidden" name="site_cd"         value="<%= g_conf_site_cd   %>" />
    								<input type="hidden" name="site_name"       value="<%= g_conf_site_name %>" />
    								<input type="hidden" name="quotaopt"        value="12"/>
    								<input type="hidden" name="currency"        value="WON"/>
    								<!-- 필수정보(변경불가) -->
    							    <input type="hidden" name="module_type"     value="<%= module_type %>"/>
    							    <input type="hidden" name="res_cd"          value=""/>
								    <input type="hidden" name="res_msg"         value=""/>
								    <input type="hidden" name="enc_info"        value=""/>
								    <input type="hidden" name="enc_data"        value=""/>
								    <input type="hidden" name="ret_pay_method"  value=""/>
								    <input type="hidden" name="tran_cd"         value=""/>
								    <input type="hidden" name="use_pay_method"  value=""/>
    								
    								<input type="hidden" name="ordr_chk"        value=""/>
    								
    								<input type="hidden" name="cash_yn"         value=""/>
 								    <input type="hidden" name="cash_tr_code"    value=""/>
  								    <input type="hidden" name="cash_id_info"    value=""/>
    								<input type="hidden" name="good_expr" value="0">		
						</form> <!-- 폼끝 -->
                                                                          
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="step-3">
                                                            <div class="no-results">
                                                                <div class="swal2-icon swal2-success swal2-animate-success-icon">
                                                                    <div class="swal2-success-circular-line-left"
                                                                         style="background-color: rgb(255, 255, 255);"></div>
                                                                    <span class="swal2-success-line-tip"></span>
                                                                    <span class="swal2-success-line-long"></span>
                                                                    <div class="swal2-success-ring"></div>
                                                                    <div class="swal2-success-fix"
                                                                         style="background-color: rgb(255, 255, 255);"></div>
                                                                    <div class="swal2-success-circular-line-right"
                                                                         style="background-color: rgb(255, 255, 255);"></div>
                                                                </div>
                                                                <div class="results-subtitle mt-4">Failed!</div>
                                                                <div class="results-title">이전 페이지로 돌아가 Pay버튼을 누르고 진행해주세요
                                                                </div>
                                                                <div class="mt-3 mb-3"></div>
                                                                <div class="text-center">
                                                                  
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="divider"></div>
                                                <div class="clearfix">
                                                    <button type="button" id="reset-btn"
                                                            class="btn-shadow float-left btn btn-link">Reset
                                                    </button>
                                                    <button type="button" id="next-btn"
                                                            class="btn-shadow btn-wide float-right btn-pill btn-hover-shine btn btn-primary">
                                                        Next
                                                    </button>
                                                    <button type="button" id="prev-btn"
                                                            class="btn-shadow float-right btn-wide btn-pill mr-3 btn btn-outline-secondary">
                                                        Previous
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ToDo List   <div class="col-md-12 col-lg-4">-->
                        
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane tabs-animation fade" id="tab-content-1" role="tabpanel">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-12 col-lg-5">
                                        <div class="main-card mb-3 card">
                                            <div class="card-header">Chat Box</div>
                                            <div class="scroll-area-sm">
                                                <div class="scrollbar-container ps ps--active-y">
                                                    <div class="chat-wrapper p-1">
                                                        <div class="chat-box-wrapper">
                                                            <div>
                                                                <div class="avatar-icon-wrapper mr-1">
                                                                    <div class="badge badge-bottom btn-shine badge-success badge-dot badge-dot-lg"></div>
                                                                    <div class="avatar-icon avatar-icon-lg rounded"><img
                                                                            src="assets/images/avatars/1.jpg"
                                                                            alt=""></div>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <div class="chat-box">But I must explain to you how all this
                                                                    mistaken idea of denouncing pleasure and praising pain
                                                                    was born and I will give you a complete account of the
                                                                    system.
                                                                </div>
                                                                <small class="opacity-6">
                                                                    <i class="fa-calendar-alt mr-1">
                                                                    </i>
                                                                    11:01 AM | Yesterday
                                                                </small>
                                                            </div>
                                                        </div>
                                                        <div class="float-right">
                                                            <div class="chat-box-wrapper chat-box-wrapper-right">
                                                                <div>
                                                                    <div class="chat-box">Expound the actual teachings of
                                                                        the great explorer of the truth, the master-builder
                                                                        of human happiness.
                                                                    </div>
                                                                    <small class="opacity-6">
                                                                        <i class="fa-calendar-alt mr-1">
                                                                        </i>
                                                                        11:01 AM | Yesterday
                                                                    </small>
                                                                </div>
                                                                <div>
                                                                    <div class="avatar-icon-wrapper ml-1">
                                                                        <div class="badge badge-bottom btn-shine badge-success badge-dot badge-dot-lg"></div>
                                                                        <div class="avatar-icon avatar-icon-lg rounded"><img
                                                                                src="assets/images/avatars/2.jpg"
                                                                                alt=""></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="chat-box-wrapper">
                                                            <div>
                                                                <div class="avatar-icon-wrapper mr-1">
                                                                    <div class="badge badge-bottom btn-shine badge-success badge-dot badge-dot-lg"></div>
                                                                    <div class="avatar-icon avatar-icon-lg rounded"><img
                                                                            src="assets/images/avatars/2.jpg"
                                                                            alt=""></div>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <div class="chat-box">But I must explain to you how all this
                                                                    mistaken idea of denouncing pleasure and praising pain
                                                                    was born and I will give you a complete account of the
                                                                    system.
                                                                </div>
                                                                <small class="opacity-6">
                                                                    <i class="fa-calendar-alt mr-1">
                                                                    </i>
                                                                    11:01 AM | Yesterday
                                                                </small>
                                                            </div>
                                                        </div>
                                                        <div class="float-right">
                                                            <div class="chat-box-wrapper chat-box-wrapper-right">
                                                                <div>
                                                                    <div class="chat-box">Denouncing pleasure and praising
                                                                        pain was born and I will give you a complete
                                                                        account.
                                                                    </div>
                                                                    <small class="opacity-6">
                                                                        <i class="fa-calendar-alt mr-1">
                                                                        </i>
                                                                        11:01 AM | Yesterday
                                                                    </small>
                                                                </div>
                                                                <div>
                                                                    <div class="avatar-icon-wrapper ml-1">
                                                                        <div class="badge badge-bottom btn-shine badge-success badge-dot badge-dot-lg"></div>
                                                                        <div class="avatar-icon avatar-icon-lg rounded"><img
                                                                                src="assets/images/avatars/2.jpg"
                                                                                alt=""></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="float-right">
                                                            <div class="chat-box-wrapper chat-box-wrapper-right">
                                                                <div>
                                                                    <div class="chat-box">The master-builder of human
                                                                        happiness.
                                                                    </div>
                                                                    <small class="opacity-6">
                                                                        <i class="fa-calendar-alt mr-1">
                                                                        </i>
                                                                        11:01 AM | Yesterday
                                                                    </small>
                                                                </div>
                                                                <div>
                                                                    <div class="avatar-icon-wrapper ml-1">
                                                                        <div class="badge badge-bottom btn-shine badge-success badge-dot badge-dot-lg"></div>
                                                                        <div class="avatar-icon avatar-icon-lg rounded"><img
                                                                                src="assets/images/avatars/3.jpg"
                                                                                alt=""></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-footer"><input
                                                    placeholder="Write here and hit enter to send..." type="text"
                                                    class="form-control-lg form-control"></div>
                                        </div>
                                        <div class="card-shadow-primary card-border mb-3 card">
                                            <div class="dropdown-menu-header">
                                                <div class="dropdown-menu-header-inner bg-info">
                                                    <div class="menu-header-image opacity-2"
                                                         style="background-image: url('assets/images/dropdown-header/abstract1.jpg');"></div>
                                                    <div class="menu-header-content btn-pane-right">
                                                        <div class="avatar-icon-wrapper mr-2 avatar-icon-xl">
                                                            <div class="avatar-icon rounded"><img
                                                                    src="assets/images/avatars/2.jpg"
                                                                    alt="Avatar 5"></div>
                                                        </div>
                                                        <div><h5 class="menu-header-title">Jessica Walberg</h5></div>
                                                        <div class="menu-header-btn-pane">
                                                            <button class="ladda-button btn btn-pill btn-dark"
                                                                    data-style="slide-right"><span class="ladda-label">Load Click</span><span
                                                                    class="ladda-spinner"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item">
                                                    <div class="widget-content">
                                                        <div class="text-center"><h5 class="widget-heading opacity-4">March
                                                            Totals</h5><h5><span class="pr-2"><b class="text-danger">12</b> new leads,</span><span><b
                                                                class="text-success">$56.24</b> in sales</span>
                                                        </h5></div>
                                                    </div>
                                                </li>
                                                <li class="p-0 list-group-item">
                                                    <div class="grid-menu grid-menu-2col">
                                                        <div class="no-gutters row">
                                                            <div class="col-sm-6">
                                                                <button class="btn-icon-vertical btn-square btn-transition btn btn-outline-link">
                                                                    <i class="lnr-license btn-icon-wrapper btn-icon-lg mb-3"> </i>View
                                                                    Profile
                                                                </button>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <button class="btn-icon-vertical btn-square btn-transition btn btn-outline-link">
                                                                    <i class="lnr-music-note btn-icon-wrapper btn-icon-lg mb-3"> </i>Leads
                                                                    Generated
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-lg-7">
                                        <div class="main-card mb-3 card">
                                            <div class="card-body">
                                                <div id="smartwizard2" class="forms-wizard-alt">
                                                    <ul class="forms-wizard">
                                                        <li>
                                                            <a href="#step-12">
                                                                <em>1</em><span>Account Information</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#step-22">
                                                                <em>2</em><span>Payment Information</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#step-32">
                                                                <em>3</em><span>Finish Wizard</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                    <!-- �댁�� �ㅽ��1 -->
                                                  
                                                        <!-- wizard2 step2 -->
                                          
                                                <div class="divider"></div>
                                                <div class="clearfix">
                                                    <button type="button" id="reset-btn2"
                                                            class="btn-shadow float-left btn btn-link">Reset
                                                    </button>
                                                    <button type="button" id="next-btn2"
                                                            class="btn-shadow btn-wide float-right btn-pill btn-hover-shine btn btn-primary">
                                                        Next
                                                    </button>
                                                    <button type="button" id="prev-btn2"
                                                            class="btn-shadow float-right btn-wide btn-pill mr-3 btn btn-outline-secondary">
                                                        Previous
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                     
                <!-- 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쎌�깍옙占� 占쏙옙占썬�э옙占쏙옙 占쎄�瑜� 占쎈�占쎄�占쏙옙占� -->
             
     <!-- 占쏙옙占쏙옙 占쏙옙嚥∽옙�⑨옙燁삼옙 筌��ο옙占� 占썬�삘�⑨�占� 占쎌�깍옙筌�占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占� -->                          
   
<!-- 占쎄�瑜� 占쏙옙占쏙옙占쏙옙占쎌�깍옙占� Show right drawer -->

          
                        <!--占쎄�瑜� 餓ο옙占쏙옙 占싼�占쏙옙�귐�占썬�쏙옙占� -->
                       
              <!-- 占쏙옙占쏙옙 占쏙옙占쏙옙 -->
   
<div class="app-drawer-overlay d-none animated fadeIn"></div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/kero/assets/scripts/main.07a59de7b920cd76b874.js"></script>
</body>
</html>
