<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="kr.co.kcp.CT_CLI"%>
<%@ page import="java.net.URLDecoder"%>
<%@ include file="../cfg/cert_conf.jsp"%>
<%	
	System.out.println(" reS page �Դϴ� " );
    /* ============================================================================== */
    /* =   ���������� ���� �� ��ȣȭ ������                                         = */
    /* = -------------------------------------------------------------------------- = */
    /* =   �ش� �������� �ݵ�� ������ ������ ���ε� �Ǿ�� �ϸ�                    = */ 
    /* =   ������ �������� ����Ͻñ� �ٶ��ϴ�.                                     = */
    /* ============================================================================== */
%>
<%!
    /* ============================================================================== */
    /* =   null ���� ó���ϴ� �޼ҵ�                                                = */
    /* = -------------------------------------------------------------------------- = */
    public String f_get_parm_str( String val )
    {
        if ( val == null ) val = "";
        return  val;
    }
    /* ============================================================================== */
%>
<%
    request.setCharacterEncoding ( "utf-8" ) ;//����

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
    
	/*------------------------------------------------------------------------*/
    /*  :: ��ü �Ķ���� �����                                               */
    /*------------------------------------------------------------------------*/
    StringBuffer sbParam = new StringBuffer();
    CT_CLI       cc      = new CT_CLI();
	cc.setCharSetUtf8(); // UTF-8 ó��

	
    // request �� �Ѿ�� �� ó��
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
            // ��� �޽����� �ѱ� ������ URL decoding ������մϴ�.
            // �θ�â���� �ѱ�� form ������ ���� �ʵ�
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
    
    // ��� ó��
    if( cert_enc_use.equals( "Y" ) )
    {
        if( res_cd.equals( "0000" ) )
        {
            // dn_hash ����
            // KCP �� ������ �帮�� dn_hash �� ����Ʈ �ڵ�, ��û��ȣ , ������ȣ�� �����Ͽ�
            // �ش� �������� �������� �����մϴ�
            if ( !cc.checkValidHash( g_conf_ENC_KEY, dn_hash, ( site_cd + ordr_idxx + cert_no ) ) )
            {
                // ���� ���н� ó�� ����

                System.out.println("dn_hash ���� ��������");
                //cc = null; // ��ü �ݳ� ( ��ƾ Ż��ÿ��� ȣ�� )
            }

            // ������ DB ó�� ������ ����

             System.out.println(site_cd);
            System.out.println(cert_no);
            //System.out.println(enc_cert_data2); // ��ȣȭ v2
            
            // ���������� ��ȣȭ �Լ�
            // �ش� �Լ��� ��ȣȭ�� enc_cert_data2 ��
            // site_cd �� cert_no �� ������ ��ȭȭ �ϴ� �Լ� �Դϴ�.
            // ���������� ��ȣȭ �Ȱ�쿡�� ���������͸� �����ü� �ֽ��ϴ�.
            cc.decryptEncCert( g_conf_ENC_KEY, site_cd, cert_no, enc_cert_data2 );
           
            System.out.println( "�̸� �ʿ� �ڲ� �����׸�������"               + cc.getKeyValue("user_name"   ) ); // �̸�              
            
            cc.setCharSetUtf8(); // ��ȣ�� ����� ���ڵ� ���� �޼��� ( UTF-8 ���ڵ� ���� �ּ��� �����Ͻñ� �ٶ��ϴ�.)  //���� �ּ�������
            
            System.out.println( "�̵���Ż� �ڵ�"    + cc.getKeyValue("comm_id"     ) ); // �̵���Ż� �ڵ�   
            System.out.println( "��ȭ��ȣ"           + cc.getKeyValue("phone_no"    ) ); // ��ȭ��ȣ          
            System.out.println( "�̸�"               + cc.getKeyValue("user_name"   ) ); // �̸�              
            System.out.println( "�������"           + cc.getKeyValue("birth_day"   ) ); // �������          
            System.out.println( "�����ڵ�"           + cc.getKeyValue("sex_code"    ) ); // �����ڵ�          
            System.out.println( "��/�ܱ��� ���� "    + cc.getKeyValue("local_code"  ) ); // ��/�ܱ��� ����    
            System.out.println( "CI"                 + cc.getKeyValue("ci"          ) ); // CI                
            System.out.println( "DI �ߺ����� Ȯ�ΰ�" + cc.getKeyValue("di"          ) ); // DI �ߺ����� Ȯ�ΰ�
            System.out.println( "CI_URL"             + URLDecoder.decode( cc.getKeyValue("ci_url"      ) ) ); // CI URL ���ڵ� ��
            System.out.println( "DI_URL"             + URLDecoder.decode( cc.getKeyValue("di_url"      ) ) ); // DI URL ���ڵ� ��
            System.out.println( "������Ʈ ���̵�  "  + cc.getKeyValue("web_siteid"  ) ); // ��ȣȭ�� ������Ʈ ���̵�
            System.out.println( "��ȣȭ�� ����ڵ�"  + cc.getKeyValue("res_cd"      ) ); // ��ȣȭ�� ����ڵ�
            System.out.println( "��ȣȭ�� ����޽���"+ cc.getKeyValue("res_msg"     ) ); // ��ȣȭ�� ����޽��� 
            
        }
        
        
        
        else/*if( res_cd.equals( "0000" ) != true )*/
        {
            // ��������
        }
    }
    else/*if( cert_enc_use.equals( "Y" ) != true )*/
    {
        // ��ȣȭ ���� ����
    }

    cc = null; // ��ü �ݳ�
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> <!-- utf-8 ���� -->
        <title>*** NHN KCP Online Payment System [Jsp Version] ***</title>
        <script src="https://code.jquery.com/jquery-latest.js"></script> 
        <script type="text/javascript">

          /*   window.onload=function()
            {	
            	
                try
                {	
					// �θ�â�� url ��û �������� �̵� ��ŵ�ϴ�                	
                	//opener.location.href = "<c:url value='/Register'/>"; 
                	
                	// �˾�â�� ������ �ؿ� �ִ� �ҽ��� ����˴ϴ�.
                	// opener.alert('reS page���� �θ�â�� alert ����') 
                	
                	// �˾�â�� alert ����
               		confirm("�޴��� ���� ����")
               		
               		
               		//document.location.href = "<c:url value='/Register'/>"
               		//opener.location.href = "<c:url value='/Register'/>";
               	}
                	
                    // opener.auth_data( document.form_auth ); // �θ�â���� �� ���� 
                    
                    //window.close();// �˾� �ݱ�  
                   
                    
                
                catch(e)
                {	
                    alert(e); // �������� �θ�â�� iframe �� ��ã�� �����
                }
            } */
        </script>
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
    </head>
    <body oncontextmenu="return false;" ondragstart="return false;" onselectstart="return false;">
        
          	<!-- The Modal -->
		    <div id="myModal" class="modal">
		 
		      <!-- Modal content -->
		      <div class="modal-content">
		                <p style="text-align: center;">
		                <span style="font-size: 14pt;">
	                		<b><span style="font-size: 24pt;">�޴��� ���� ����</span></b></span>
		                </p>
		               <!--  <p style="text-align: center; line-height: 1.5;"><br /></p>
		                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">����Ʈ ���� ��������</span></p>
		                <p style="text-align: center; line-height: 1.5;"><b><span style="color: rgb(255, 0, 0); font-size: 14pt;">10:00 - 18:00 ����</span></b></p>
		                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">����Ʈ ����� ���� �˴ϴ�.</span></p>
		                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><br /></span></p>
		                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">�̿뿡 ������ �帰 �� ���ظ� </span></p>
		                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">��Ź�帳�ϴ�.</span></p>
		                <p style="text-align: center; line-height: 1.5;"><br /></p>
		                <p><br /></p> -->
		                
	            	<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
		                <span class="pop_bt" style="font-size: 13pt;" >
		                    	 �ݱ�
		                </span>
		            </div>
		      </div>
		 
		    </div>
        <!--End Modal-->
        
        <form name="form_auth" method="post">
       	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <%= sbParam.toString() %>
        </form>
        
        <script type="text/javascript">
      
	        jQuery(document).ready(function() {
	             $('#myModal').show();
	        });
	        //�˾� Close ���
	        function close_pop(flag) {
	             $('#myModal').hide();
	          	// �θ�â�� url ��û ������(ȸ������ �������� �̵� ��ŵ�ϴ�)                	
             	opener.location.href = "<c:url value='/Register'/>"; 
             	window.close();// �˾� �ݱ�  
	        };
        
      </script>
        
    </body>
</html>
