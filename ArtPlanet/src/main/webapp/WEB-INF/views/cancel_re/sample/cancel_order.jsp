<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding ("utf-8");

    /* ============================================================================== */
    /* =   PAGE : 취소모듈 PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2013   KCP Inc.   All Rights Reserved.                    = */
    /* ============================================================================== */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <title>Art Planet - 취소</title>
    <meta http-equiv="X-UA-Compatible" content="text/html;charset=utf-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
  <link
   href="${pageContext.request.contextPath}/resources/kero/main.07a59de7b920cd76b874.css" rel="stylesheet">
    <script type="text/javascript">
	function  jsf__go_mod( form )
    {
        if ( form.tno.value.length < 14 )
        {
            alert( "KCP 거래 번호 14자리를 입력하세요" );
            form.tno.focus();
            form.tno.select();
            return false;
        }
		  else
        {
            return true;
        }
	}
	function  sub_cancel_chk( val )
    {
        if( val == "STPC")
        {
            show_sub_cancel.style.display = "block";
        }
        else
        {
            show_sub_cancel.style.display = "none";
        }
    }
	    </script>
</head>
<body oncontextmenu="return false;" ondragstart="return false;" onselectstart="return false;">
	<!-- 케로 관리자UI -->
   	<div class="app-container app-theme-gray">
		  <div class="app-main">
            <div class="app-sidebar-wrapper">
                <div class="app-sidebar sidebar-shadow">
                
                <div class="app-header__logo">
                        <a href="#" data-toggle="tooltip" data-placement="bottom" title="KeroUI Admin Template" class="logo-src"></a>
                        <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
                        </button>
                    </div>
                    <div class="scrollbar-sidebar scrollbar-container">
                        <div class="app-sidebar__inner">
                     	</div>
                     </div>
                  </div>
              </div><!-- side bar -->
              
              <!-- 여기 -->
               <div class="app-main__outer">
               <div class="app-header">
                        <div class="page-title-heading">
                            취소주문페이지
                            <div class="page-title-subheading">
                                페이지는 취소오더를 출력하는 페이지입니다.
                            </div>
                        </div>
                        
               </div><!-- app header --> 
              <div class="app-inner-layout app-inner-layout-page">
                        <div class="app-inner-layout__wrapper">
                            <div class="app-inner-layout__content pt-1">
                                <div class="tab-content">
                                    <div class="container-fluid">
                                        <div class="row">
                                         
                                          <!-- product-dashboard 시작 -->
                                            <div class="main-card mb-3 card">
                                            <div class="card-header">
                                                <div class="card-header-title font-size-lg text-capitalize font-weight-normal">
                                                    Company Agents Status
                                                </div>
                                                <div class="btn-actions-pane-right">
                                                    <button type="button" id="PopoverCustomT-1"
                                                            class="btn-icon btn-wide btn-outline-2x btn btn-outline-focus btn-sm">
                                                        Actions Menu
                                                        <span class="pl-2 align-middle opactiy-7">
                                    					<i class="fa fa-angle-down"></i>
                                						</span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="table-responsive">
                                                <table class="align-middle text-truncate mb-0 table table-borderless table-hover">
                                                    <thead>
                                                    <tr>
                                                        <th class="text-center">#</th>
                                                        <th class="text-center">Avatar</th>
                                                        <th class="text-center">Name</th>
                                                        <th class="text-center">Company</th>
                                                        <th class="text-center">Status</th>
                                                        <th class="text-center">Due Date</th>
                                                        <th class="text-center">Target Achievement</th>
                                                        <th class="text-center">Actions</th>
                                                    </tr>
                                                    </thead>
                                                    
                                                    <tbody>
                                                    <tr>
                                                        <td class="text-center text-muted" style="width: 80px;">#54</td>
                                                        <td class="text-center" style="width: 80px;">
                                                            <img width="40" class="rounded-circle" src="assets/images/avatars/1.jpg" alt="">
                                                        </td>
                                                        <td class="text-center"><a href="javascript:void(0)">Juan C.
                                                            Cargill</a>
                                                        </td>
                                                        <td class="text-center"><a href="javascript:void(0)">Micro
                                                            Electronics</a></td>
                                                        <td class="text-center">
                                                            <div class="badge badge-pill badge-danger">Canceled</div>
                                                        </td>
                                                        <td class="text-center">
							                                    <span class="pr-2 opacity-6">
							                                        <i class="fa fa-business-time"></i>
							                                    </span>
							                                                            12 Dec
                                                        </td>
                                                        <td class="text-center" style="width: 200px;">
                                                            <div class="widget-content p-0">
                                                                <div class="widget-content-outer">
                                                                    <div class="widget-content-wrapper">
                                                                        <div class="widget-content-left pr-2">
                                                                            <div class="widget-numbers fsize-1 text-danger">
                                                                                71%
                                                                            </div>
                                                                        </div>
                                                                        <div class="widget-content-right w-100">
                                                                            <div class="progress-bar-xs progress">
                                                                                <div class="progress-bar bg-danger"
                                                                                     role="progressbar" aria-valuenow="71"
                                                                                     aria-valuemin="0" aria-valuemax="100"
                                                                                     style="width: 71%;"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="text-center">
                                                            <div role="group" class="btn-group-sm btn-group">
                                                                <button class="btn-shadow btn btn-primary">Hire</button>
                                                                <button class="btn-shadow btn btn-primary">Fire</button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                            		</tbody>
                                         	</table>
                                         </div>
                                         </div><!-- main-card mb-3 card -->
                                         <!-- product-dashboard 끝 -->
                                            <div class="col-md-12">
                 
                                                <div class="main-card mb-3 card">
                                                    
                                                    <div class="card-body">
                                                        <div class="card-title">
     													 취소 주문 출력하는 페이지입니다.<br />
     						 							요청이 정상적으로 처리된 경우 결과코드(res_cd)값이 0000으로 표시됩니다.
     													 </div>
                                                        <!-- Button trigger modal -->
                                                        <button type="button" class="btn mr-2 mb-2 btn-primary" data-toggle="modal" data-target="#exampleModal">
                                                           	 취소
                                                        </button>
                                                    </div><!-- card-body -->
                                                 </div><!-- main card mb -->
                                             </div><!-- col md 12 -->
                                         </div><!-- row -->
                                     </div><!-- container-fluid -->
                                   </div><!-- tab-content -->
                              </div> <!-- app inner layout -->     
                        </div><!-- app inner layout___wrapper -->
                 </div><!-- app-inner-layout app-inner-layout-page -->
               
               </div><!-- app-main outer -->       
           </div><!-- app-main -->
     </div><!-- app-container gray -->   
                        
   
    
    <!-- javascript -->
 	<script type="text/javascript" src="<c:url value='/resources/kero/assets/scripts/main.07a59de7b920cd76b874.js'/>"></script>
 	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	     aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">카드결제건 취소</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	               
	                 <form name="acnt_form" action="Cancel.do" method="post" >
        <table class="tbl" cellpadding="0" cellspacing="0">
		<tr>
                <th>거래번호</th>
                <td><input type="text" name="tno" value=""  class="frminput" size="20" maxlength="14"/></td>
            </tr>
            <!-- 변경유형 -->
            <tr>
                <th>변경 유형</th>
                <td>
                    <select name="mod_type" class="frmselect" onChange="sub_cancel_chk(this.value);"/>
                        <option value="STSC">전체 취소요청</option>
                        <option value="STPC">부분 취소요청</option>
                    </select>
                </td>
            </tr>
            <!-- 변경사유 -->
            <tr>
                <th>변경사유</th>
                <td><input type="text" name="mod_desc" value=""  class="frminput" size="40" maxlength="100"/></td>
            </tr>
        </table>
        <!-- 부분취소테이블 -->
		<table id="show_sub_cancel" style="display:none" class="tbl" cellpadding="0" cellspacing="0">
            <!-- 요청 구분 : 개별승인 환불요청 정보 -->
            <tr>
                <th>요청 구분</th>
                <td>부분 취소요청</td>
            </tr>
            <!-- Input : 부분환불 요청 금액 입력 -->
            <tr>
                <th>부분취소 요청 금액</th>
                <td><input type="text" name="mod_mny" value=""  class="frminput" size="20" maxlength="10"/></td>
            </tr>
            <!-- Input : 부분환불 전 남은 금액(rem_mny) 입력 -->
            <tr>
                <th>부분취소 전 남은 금액</th>
                <td><input type="text" name="rem_mny" value="" class="frminput" size="20" maxlength="10"/></td>
            </tr>
			
			<tr>
                <th>과세금액</th>
                <td><input type="text" name="mod_tax_mny" value="" class="frminput" size="20" maxlength="10"/></td>
            </tr>
			
			<tr>
                <th>부가세 금액</th>
                <td><input type="text" name="mod_vat_mny" value="" class="frminput" size="20" maxlength="10"/></td>
            </tr>
			
			<tr>
                <th>비과세 금액</th>
                <td><input type="text" name="mod_free_mny" value="" class="frminput" size="20" maxlength="10"/></td>
            </tr>

        </table>        
    <input type="hidden" name = "req_tx"       value="mod"/>
    <!-- 
    <input name="" type="submit" class="submit" value="취소요청" onclick="return jsf__go_mod(this.form);"/>
   <button type="button" class="btn btn-primary" onclick="return jsf__go_mod(this.form);">취소하기</button> -->
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                <button type="submit" class="btn btn-primary" onclick="return jsf__go_mod(this.form);">취소하기</button>
	            </div>
	            </form>
	        </div><!-- modal-content -->
	    </div><!-- modal dialog -->
	</div><!-- 모달끝 class="modal fade" id="exampleModal" -->
</body>
</html>
