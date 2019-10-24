
  // 인증창 종료 후 인증데이터 리턴 함수
            function auth_data( frm )
            {
                var auth_form     = document.form_auth;
                var nField        = frm.elements.length;
                var response_data = "";

                // up_hash 검증 
                if( frm.up_hash.value != auth_form.veri_up_hash.value )
                {
                    alert("up_hash 변조 위험있음");
                    
                }              
                
               /* 리턴 값 모두 찍어보기 (테스트 시에만 사용) */
                var form_value = "";

<<<<<<< HEAD
        // up_hash 검증 
       /* if( frm.up_hash.value != auth_form.veri_up_hash.value )
        {
            alert("up_hash 변조 위험있음");
=======
                for ( i = 0 ; i < frm.length ; i++ )
                {
                    form_value += "["+frm.elements[i].name + "] = [" + frm.elements[i].value + "]\n";
                }
                alert(form_value);
            }
>>>>>>> branch 'master' of https://github.com/nyupe/ArtPlanet.git
            
<<<<<<< HEAD
        }     */         
        
       /* 리턴 값 모두 찍어보기 (테스트 시에만 사용) */
        var form_value = "";

        for ( i = 0 ; i < frm.length ; i++ )
        {
            form_value += "["+frm.elements[i].name + "] = [" + frm.elements[i].value + "]\n";
        }
        alert(form_value);
    }
=======
            // 인증창 호출 함수
            function auth_type_check()
            {
                var auth_form = document.form_auth;
>>>>>>> branch 'master' of https://github.com/nyupe/ArtPlanet.git
    
                if( auth_form.ordr_idxx.value == "" )
                {
                    alert( "요청번호는 필수 입니다." );
    
                    return false;
                }
                else
                {
                    if( ( navigator.userAgent.indexOf("Android") > - 1 || navigator.userAgent.indexOf("iPhone") > - 1 ) == false ) // 스마트폰이 아닌경우
                    {
	                    var return_gubun;
	                    var width  = 410;
	                    var height = 500;
	
	                    var leftpos = screen.width  / 2 - ( width  / 2 );
	                    var toppos  = screen.height / 2 - ( height / 2 );
	
	                    var winopts  = "width=" + width   + ", height=" + height + ", toolbar=no,status=no,statusbar=no,menubar=no,scrollbars=no,resizable=no";
	                    var position = ",left=" + leftpos + ", top="    + toppos;
	                    var AUTH_POP = window.open('','auth_popup', winopts + position);
                    }
                    
                    auth_form.target = "auth_popup"; // !!주의 고정값 ( 리턴받을때 사용되는 타겟명입니다.)
                    
                    
                    auth_form.action = "AuthReq.do";
                    //auth_form.action = "./kcpcert_proc_req.jsp"; // 인증창 호출 및 결과값 리턴 페이지 주소
                    
                    return true;
                }
            }
<<<<<<< HEAD
            
            auth_form.target = "auth_popup"; // !!주의 고정값 ( 리턴받을때 사용되는 타겟명입니다.)
            /* https://testcert.kcp.co.kr/kcp_cert/cert_view.jsp */
            auth_form.form = "./kcpcert_proc_req.jsp"; // 인증창 호출 및 결과값 리턴 페이지 주소
            
            return true;
        }
    }

    /* 예제 */
    window.onload=function()
    {
        var today            = new Date();
        var year             = today.getFullYear();
        var month            = today.getMonth() + 1;
        var date             = today.getDate();
        var time             = today.getTime();
        var year_select_box  = "<option value=''>선택 (년)</option>";
        var month_select_box = "<option value=''>선택 (월)</option>";
        var day_select_box   = "<option value=''>선택 (일)</option>";
        
        if(parseInt(month) < 10) {
            month = "0" + month;
        }

        if(parseInt(date) < 10) {
            date = "0" + date;
        }

        year_select_box = "<select name='year' class='frmselect' id='year_select'>";
        year_select_box += "<option value=''>선택 (년)</option>";

        for(i=year;i>(year-100);i--)
        {
            year_select_box += "<option value='" + i + "'>" + i + " 년</option>";
        }
        
        year_select_box  += "</select>";
        month_select_box  = "<select name=\"month\" class=\"frmselect\" id=\"month_select\">";
        month_select_box += "<option value=''>선택 (월)</option>";
        
        for(i=1;i<13;i++)
        {
            if(i < 10)
=======
    
            /* 예제 */
            window.onload=function()
>>>>>>> branch 'master' of https://github.com/nyupe/ArtPlanet.git
            {
                var today            = new Date();
                var year             = today.getFullYear();
                var month            = today.getMonth() + 1;
                var date             = today.getDate();
                var time             = today.getTime();
                var year_select_box  = "<option value=''>선택 (년)</option>";
                var month_select_box = "<option value=''>선택 (월)</option>";
                var day_select_box   = "<option value=''>선택 (일)</option>";
                
                if(parseInt(month) < 10) {
                    month = "0" + month;
                }
    
                if(parseInt(date) < 10) {
                    date = "0" + date;
                }
    
                year_select_box = "<select name='year' class='frmselect' id='year_select'>";
                year_select_box += "<option value=''>선택 (년)</option>";
       
                for(i=year;i>(year-100);i--)
                {
                    year_select_box += "<option value='" + i + "'>" + i + " 년</option>";
                }
                
                year_select_box  += "</select>";
                month_select_box  = "<select name=\"month\" class=\"frmselect\" id=\"month_select\">";
                month_select_box += "<option value=''>선택 (월)</option>";
                
                for(i=1;i<13;i++)
                {
                    if(i < 10)
                    {
                        month_select_box += "<option value='0" + i + "'>" + i + " 월</option>";
                    }
                    else
                    {
                        month_select_box += "<option value='" + i + "'>" + i + " 월</option>";
                    }
                }
                
                month_select_box += "</select>";
                day_select_box    = "<select name=\"day\"   class=\"frmselect\" id=\"day_select\"  >";
                day_select_box   += "<option value=''>선택 (일)</option>";
                for(i=1;i<32;i++)
                {
                    if(i < 10)
                    {
                        day_select_box += "<option value='0" + i + "'>" + i + " 일</option>";
                    }
                    else
                    {
                        day_select_box += "<option value='" + i + "'>" + i + " 일</option>";
                    }
                }
                
                day_select_box += "</select>";
                
                document.getElementById( "year_month_day"  ).innerHTML = year_select_box + month_select_box + day_select_box;
            }
