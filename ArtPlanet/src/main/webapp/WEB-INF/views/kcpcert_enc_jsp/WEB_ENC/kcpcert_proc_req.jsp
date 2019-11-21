<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="kr.co.kcp.CT_CLI"%>
<%@ page import="java.net.URLDecoder"%>
<%@ include file="../cfg/cert_conf.jsp"%>
<%
	System.out.println("인증 reQ page입니다");	
    /* ============================================================================== */
    /* =   인증데이터 수신 및 복호화 페이지                                         = */
    /* = -------------------------------------------------------------------------- = */
    /* =   해당 페이지는 반드시 가맹점 서버에 업로드 되어야 하며                    = */ 
    /* =   가급적 수정없이 사용하시기 바랍니다.                                     = */
    /* ============================================================================== */
%>
<%!
    /* ============================================================================== */
    /* =   null 값을 처리하는 메소드                                                = */
    /* = -------------------------------------------------------------------------- = */
    public String f_get_parm_str( String val )
    {
        if ( val == null ) val = "";
        return  val;
    }
    /* ============================================================================== */
%>
<%
    request.setCharacterEncoding ( "euc-kr" ) ;//수정

    String site_cd       = "";
    String ordr_idxx     = "";
    
    String cert_no       = "";
    String cert_enc_use  = "";
    String enc_cert_data2 = "";
    String enc_info      = "";
    String enc_data      = "";
    String req_tx        = "";
    
    String tran_cd       = "";
    String res_cd        = "";
    String res_msg       = "";

    String dn_hash       = "";
    
    boolean pageMove=false;
    
	/*------------------------------------------------------------------------*/
    /*  :: 전체 파라미터 남기기                                               */
    /*------------------------------------------------------------------------*/
    StringBuffer sbParam = new StringBuffer();
    CT_CLI       cc      = new CT_CLI();
	//cc.setCharSetUtf8(); // UTF-8 처리

	
    // request 로 넘어온 값 처리
    Enumeration params = request.getParameterNames();
    while(params.hasMoreElements())
    {
        String nmParam = (String) params.nextElement();
        String valParam[] = request.getParameterValues(nmParam);

        for(int i = 0; i < valParam.length;i++)
        {
            if( nmParam.equals( "site_cd"      ) )
            {
                site_cd = f_get_parm_str( valParam[i] );
            }
            
            if( nmParam.equals( "ordr_idxx"    ) )
            {
                ordr_idxx = f_get_parm_str( valParam[i] );
            }
            
            if( nmParam.equals( "res_cd"       ) )
            {
                res_cd = f_get_parm_str( valParam[i] );
            }
            
            if( nmParam.equals( "cert_enc_use" ) )
            {
                cert_enc_use = f_get_parm_str( valParam[i] );
            }
            
            if( nmParam.equals( "req_tx"       ) )
            {
                req_tx = f_get_parm_str( valParam[i] );
            }
            
            if( nmParam.equals( "cert_no"      ) )
            {
                cert_no = f_get_parm_str( valParam[i] );
            }
            
            if( nmParam.equals( "enc_cert_data2" ) )
            {
                enc_cert_data2 = f_get_parm_str( valParam[i] );
            }
            
            if( nmParam.equals( "dn_hash"       ) )
            {
                dn_hash = f_get_parm_str( valParam[i] );
            }
            // 결과 메시지가 한글 데이터 URL decoding 해줘야합니다.
            // 부모창으로 넘기는 form 데이터 생성 필드
            if( nmParam.equals( "res_msg"       ) )
            {
                sbParam.append( "<input type=\"hidden\" name=\"" + nmParam + "\" value=\"" + URLDecoder.decode( valParam[i], "UTF-8" ) + "\"/>" );
            }
            else
            {
                sbParam.append( "<input type=\"hidden\" name=\"" + nmParam + "\" value=\"" + f_get_parm_str( valParam[i] ) + "\"/>" );
            }

        }
    }
    
    // 결과 처리
    if( cert_enc_use.equals( "Y" ) )
    {
        if( res_cd.equals( "0000" ) )
        {
            // dn_hash 검증
            // KCP 가 리턴해 드리는 dn_hash 와 사이트 코드, 요청번호 , 인증번호를 검증하여
            // 해당 데이터의 위변조를 방지합니다
            if ( !cc.checkValidHash( g_conf_ENC_KEY, dn_hash, ( site_cd + ordr_idxx + cert_no ) ) )
            {
                // 검증 실패시 처리 영역

                System.out.println("dn_hash 변조 위험있음");
                //cc = null; // 객체 반납 ( 루틴 탈출시에만 호출 )
            }
			
            
            
            
            
            // 가맹점 DB 처리 페이지 영역
            
            
			
   		 	System.out.println(site_cd);
            System.out.println(cert_no); 
            //System.out.println(enc_cert_data2); // 암호화 v2
            
            // 인증데이터 복호화 함수
            // 해당 함수는 암호화된 enc_cert_data2 를
            // site_cd 와 cert_no 를 가지고 복화화 하는 함수 입니다.
            // 정상적으로 복호화 된경우에만 인증데이터를 가져올수 있습니다.
            cc.decryptEncCert( g_conf_ENC_KEY, site_cd, cert_no, enc_cert_data2 );
           
            //System.out.println( "이름 너왜 자꾸 깨져그만좀깨져"               + cc.getKeyValue("user_name"   ) ); // 이름              
             
             
            //cc.setCharSetUtf8(); // 복호와 결과값 인코딩 변경 메서드 ( UTF-8 인코딩 사용시 주석을 해제하시기 바랍니다.)  //수정 주석해제함
            
           
          /*   System.out.println( "이동통신사 코드"    + cc.getKeyValue("comm_id"     ) ); // 이동통신사 코드   
            System.out.println( "전화번호"           + cc.getKeyValue("phone_no"    ) ); // 전화번호          
            System.out.println( "이름"               + cc.getKeyValue("user_name"   ) ); // 이름              
            System.out.println( "생년월일"           + cc.getKeyValue("birth_day"   ) ); // 생년월일          
            System.out.println( "성별코드"           + cc.getKeyValue("sex_code"    ) ); // 성별코드          
            System.out.println( "내/외국인 정보 "    + cc.getKeyValue("local_code"  ) ); // 내/외국인 정보    
            System.out.println( "CI"                 + cc.getKeyValue("ci"          ) ); // CI                
            System.out.println( "DI 중복가입 확인값" + cc.getKeyValue("di"          ) ); // DI 중복가입 확인값
            System.out.println( "CI_URL"             + URLDecoder.decode( cc.getKeyValue("ci_url"      ) ) ); // CI URL 인코딩 값
            System.out.println( "DI_URL"             + URLDecoder.decode( cc.getKeyValue("di_url"      ) ) ); // DI URL 인코딩 값
            System.out.println( "웹사이트 아이디  "  + cc.getKeyValue("web_siteid"  ) ); // 암호화된 웹사이트 아이디 
            System.out.println( "암호화된 결과코드"  + cc.getKeyValue("res_cd"      ) ); // 암호화된 결과코드
            System.out.println( "암호화된 결과메시지"+ cc.getKeyValue("res_msg"     ) ); // 암호화된 결과메시지  
            */ 
         	
            
            
            // 스크립틀릿으로 회원가입폼에 넘겨줄 정보저장
            String name = cc.getKeyValue("user_name");
       		String birth = cc.getKeyValue("birth_day");
            String phoneNumber = cc.getKeyValue("phone_no");
            
            // 리퀘스트 영역 인코딩 방식 설정 - UTF-8 
            request.setCharacterEncoding("UTF-8");
            
            // 리퀘스트 영역에 스크립틀릿으로 저장한 변수 저장
           	request.setAttribute("auth_name", name);
           	request.setAttribute("auth_birth", birth);
           	request.setAttribute("auth_phone", phoneNumber);
          
           	
           	//System.out.println("리퀘스트 영역에 저장한 것 출력 : "+request.getAttribute("auth_name"));
            //System.out.println("어플리케이션 영역에 저장한 것 출력 : "+application.getAttribute("a_auth_name"));
            
	    }
	    else/*if( res_cd.equals( "0000" ) != true )*/
	    {
	        // 인증실패
	    }
        
    }
    else/*if( cert_enc_use.equals( "Y" ) != true )*/
    {
        // 암호화 인증 안함
    }
		
    //cc = null; // 객체 반납
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> <!-- utf-8 수정 -->
        <title>*** NHN KCP Online Payment System [Jsp Version] ***</title>
        
        <!-- 모달을 위한 라이브러리 (인증 성공 안내창) -->
        <script src="https://code.jquery.com/jquery-latest.js"></script>
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8=" crossorigin="anonymous"></script>         
    </head>
    
     <!-- 모달 디자인 시작 -->
     <style>
	        
	        /* The Modal (background) */
	        .modal {
	            display: none; /* Hidden by default */
	            position: fixed; /* Stay in place */
	            z-index: 1; /* Sit on top */
	            left: 0;
	            top: 0;
	            width: 100%; /* Full width */
	            height: 100%; /* Full height */
	            overflow: auto; /* Enable scroll if needed */
	            background-color: rgb(0,0,0); /* Fallback color */
	            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	        }
	    
	        /* Modal Content/Box */
	        .modal-content {
	            background-color: #fefefe;
	            margin: 15% auto; /* 15% from the top and centered */
	            padding: 20px;
	            border: 1px solid #888;
	            width: 30%; /* Could be more or less, depending on screen size */                          
	        }
	 
	</style>
	<!-- 모달 디자인 끝 -->
	
	
    <body oncontextmenu="return false;" ondragstart="return false;" onselectstart="return false;">
        	
        	
        	
        	
        	<!-- 모달 시작 -->
		    <div id="myModal" class="modal">
		 	
		      <!-- Modal content -->
		      <div class="modal-content">
		                <p style="text-align: center;">
		                <span style="font-size: 14pt;">
	                		<b><span style="font-size: 24pt;">휴대폰 인증 성공</span></b></span>
		                </p>
					<!-- 닫기 버튼  시작-->		                
	            	<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
		                <span class="pop_bt" style="font-size: 13pt;" >
		                    	 닫기
		                </span>
		            </div>
		            <!-- 닫기 버튼  끝-->
		      </div>
		 
		    </div>
        	<!-- 모달 끝 -->
        	
        	
        
       <%--  <form name="form_auth" method="post">
       	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <%= sbParam.toString() %>
        </form> --%>
        
        <script type="text/javascript">
      		
        	//모달을 띄워주는 진입점 
	        jQuery(document).ready(function() {
	             $('#myModal').show();
	             //console.log(opener);
	        });
        	
	        //닫기 버튼 눌렀을때 실행되는 함수
	        function close_pop(flag) {
	            $('#myModal').hide(); // id가 myModal인 태그를 브라우저에서 숨긴다
	            
	            // 부모창 태그접근 및 값 변경
	            opener.document.getElementById("auth_name").value = '<c:out value="${requestScope.auth_name}"/>';
	            opener.document.getElementById("auth_birth").value = '<c:out value="${requestScope.auth_birth}"/>';
	            opener.document.getElementById("auth_phone").value = '<c:out value="${requestScope.auth_phone}"/>';
	            
	            //if(opener.transfer()=="undefined")
            		//alert("부모창에 제어 지정한 함수 없음");
             	
             	// 부모창 함수제어
             	opener.transfer()
             	// 팝업창 닫기
             	window.close();  
	        };	    
	        
      </script>
      
    </body>
</html>
