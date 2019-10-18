<%@ page language="java" contentType="text/html;charset=euc-kr"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>*** KCP Online Payment System [JSP Version] ***</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
   <link
   href="${pageContext.request.contextPath}/resources/kero/main.07a59de7b920cd76b874.css"
   rel="stylesheet">
    <script type="text/javascript">

        // �ֹ���ȣ ���� ����
        function init_orderid()
        {
            var today = new Date();
            var year  = today.getFullYear();
            var month = today.getMonth()+ 1;
            var date  = today.getDate();
            var time  = today.getTime();

            if(parseInt(month) < 10)
            {
                month = "0" + month;
            }

            var vOrderID = year + "" + month + "" + date + "" + time;

            document.forms[0].ordr_idxx.value = vOrderID;
        }

        function  jsf__pay( form )
        {
            if ( jsf__chk( form ) == true )
            {
                return  true;
            }
            else
            {
                return  false;
            }
        }
        
        function jsf__chk( form )
        {
            if ( form.batch_key.value.length != 16 )
            {
                alert("����Ű ���� ��Ȯ�� �Է��� �ֽñ� �ٶ��ϴ�.");
                form.batch_key.focus();
                return false;
            }
            else
            {
                return true;
            }
        }

    </script>
</head>

<body onload="init_orderid();">

<!-- �ɷ� ������UI -->
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
              
              <!-- ���� -->
               <div class="app-main__outer">
               <div class="app-header">
                        <div class="page-title-heading">
                            ������ݰ�����û������
                            <div class="page-title-subheading">
                                ������ݰ�����û����� ����ϴ� �������Դϴ�.
                            </div>
                        </div>
                        
               </div><!-- app header --> 
              <div class="app-inner-layout app-inner-layout-page">
                        <div class="app-inner-layout__wrapper">
                            <div class="app-inner-layout__content pt-1">
                                <div class="tab-content">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="main-card mb-3 card">
                                                    <div class="card-body">
                                                        <div class="card-title">
                                                        <!-- ���� -->
<div id="sample_wrap">

    <form name="form_order" method="post" action="RecurringPayHub.do">
				<!-- �ɷ�UI -->
				 <div id="step-2">
                     <div id="accordion" class="accordion-wrapper mb-3">
                        <div class="card">
                           <div id="headingOne" class="card-header">
                              <button type="button" data-toggle="collapse"
                                 data-target="#collapseOne" aria-expanded="false"
                                 aria-controls="collapseOne"
                                 class="text-left m-0 p-0 btn btn-link btn-block">
                                 <!-- STEP2 �Է��� -->
                                 <span class="form-heading">[�ſ�ī�� ������� ������û]
                                    <p>�� �������� ��û���� ����Ű�� �Է��Ͽ� �ſ�ī�� ���� ��û���ϴ� �������Դϴ�.</br><br>
                               ���� ��û �� ����Ű�� �ټ��� ��� �ش� ��⿡ �����ϴ� ���� Ű ���� ����ڿ� �°� �ݾװ� �Һθ� �����Ͽ��ֽñ� �ٶ��ϴ�.</p>
                                 </span>
                              </button>
                           </div>
                           <div data-parent="#accordion" id="collapseOne"
                              aria-labelledby="headingOne" class="collapse show">
                              <div class="card-body">
                                 <!-- PG��� ���� ����Ʈ�� �����ϱ� -->
                                 <form name="order_info" method="post" action="Hub.do">
                                    <div class="form-row">
                                       <div class="col-md-6">
                                          <label>���ҹ��</label> 
											<input class="form-control"
                                                 type="text" name="pay_method"
                                                value="CARD" maxlength="40" />
                                       </div>

                                       <div class="col-md-6">
                                          <div class="position-relative form-group">
                                             <label>�ֹ���ȣ</label> <input class="form-control"
                                                placeholder="�ֹ���ȣ" type="text" name="ordr_idxx"
                                                value="TEST1234" maxlength="40" />
                                          </div>
                                       </div>
                                       <div class="col-md-6">
                                          <div class="position-relative form-group">
                                             <label>��ǰ��</label> <input class="form-control"
                                                type="text" name="good_name" value="�����Ŀ�_TEST " />
                                          </div>
                                       </div>

                                       <div class="col-md-6">
                                          <div class="position-relative form-group">
                                             <label>�ֹ��ڸ�</label> <input class="form-control"
                                                type="text" name="buyr_name" value="ȫ�浿" />
                                          </div>
                                       </div>

                                    </div>
                                    <div class="position-relative form-group">
                                       <label>�����ݾ�</label> <input class="form-control" type="text"
                                          name="good_mny" value="1004" maxlength="9" />��(���ڸ� �Է�)
                                    </div>

                                    <div class="form-group">
                                       <label for="email">Email</label>
                                       <div>
                                          <input type="text" class="form-control" id="email"
                                             name="buyr_mail" placeholder="Email" value="test@test.co.kr" />
                                       </div>
                                    </div>

                                    <div class="position-relative form-group">
                                       <label>��ȭ��ȣ</label> 
                                       <input value="02-0000-0000"
                                          name="buyr_tel1" placeholder="02-0000-1234" type="text"
                                          class="form-control">
                                    </div>

                                    <div class="position-relative form-group">
                                       <label>�޴�����ȣ</label> 
                                       <input value="010-0000-0000"
                                          name="buyr_tel2" placeholder="010-0000-1234" type="text"
                                          class="form-control">
                                    </div>
                                    
                                    <div class="position-relative form-group">
                                       <label>����Ű</label> 
                                       <input value=""
                                          name="bt_batch_key" placeholder="010-0000-1234" type="text"
                                          class="form-control">
                                    </div>
                                    
                                     <div class="position-relative form-group">
                                       <label>�׷�ID</label> 
                                       <input value="BA0011000348"
                                          name="bt_group_id" placeholder="010-0000-1234" type="text"
                                          class="form-control">
                                    </div>
                                    
                                    <div class="position-relative form-group">
                                       <label>�Һΰ���</label> 
                                       <input value="00"
                                          name="quotaopt" placeholder="010-0000-1234" type="text"
                                          class="form-control">
                                    </div>

                                    <!-- ������û ��ư
                                    <input name="button" type="button" class="submit" value="������û" onclick="jsf__pay(this.form);"/>-->
                                    <button type="button"
                                       class="btn-shadow btn-wide float-right btn-pill btn-hover-shine btn btn-primary"
                                       onclick="jsf__pay(this.form);">Pay</button>

                                   
                                 </form>
                                 <!-- ���� -->

                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
				
				
				
				<!-- �ɷ�UI�� -->
                    <h1> <span>������</span></h1>
                    <!-- ��� ���� -->
                    <div class="sample">
                         
                    <!-- ��� ���̺� End -->
				
                <!-- �ֹ����� Ÿ��Ʋ -->
                    <h2>&sdot; �ֹ� ����</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">

                    <!-- ���� ��� -->
                    <tr>
                        <th>���� ���</th>
                        <td><input type="text" name="pay_method" value="CARD" size="13" class="w100" readonly/></td>
                    </tr>
                    <!-- �ֹ� ��ȣ -->
                    <tr>
                        <th>�ֹ� ��ȣ</th>
                        <td><input type="text" name="ordr_idxx" class="w200" value="" maxlength="40"/></td>
                    </tr>
                    <!-- ��ǰ�� -->
                    <tr>
                        <th>��ǰ��</th>
                        <td><input type="text" name="good_name" class="w100" value="�ȭ"/></td>
                    </tr>
                    <!-- ���� �ݾ� -->
                    <tr>
                        <th>���� �ݾ�</th>
                        <td><input type="text" name="good_mny" class="w100" value="1004" maxlength="9"/>��(���ڸ� �Է�)</td>
                    </tr>
                    <!-- �ֹ��� �̸� -->
                    <tr>
                        <th>�ֹ��ڸ�</th>
                        <td><input type="text" name="buyr_name" class="w100" value="ȫ�浿"/></td>
                    </tr>
                    <!-- �ֹ��� E-Mail -->
                    <tr>
                        <th>E-mail</th>
                        <td><input type="text" name="buyr_mail" class="w200" value="test@test.co.kr" maxlength="30" /></td>
                    </tr>
                    <!-- �ֹ��� ��ȭ��ȣ -->
                    <tr>
                        <th>��ȭ��ȣ</th>
                        <td><input type="text" name="buyr_tel1" class="w100" value="02-2108-1000"/></td>
                    </tr>
                    <!-- �ֹ��� �޴�����ȣ -->
                    <tr>
                        <th>�޴�����ȣ</th>
                        <td><input type="text" name="buyr_tel2" class="w100" value="010-0000-0000"/></td>
                    </tr>
                    </table>
                    <!-- �ֹ� ���� ��� ���̺� End -->

                    <!-- ������� ���� ��� ���̺� Start -->
                    <h2>&sdot; ������� ����</h2>
                    <table class="tbl" cellpadding="0" cellspacing="0">
                    <!-- ����Ű -->
                    <tr>
                        <th>����Ű</th>
                        <td><input type="text" name="bt_batch_key" value="" class="w100" /></td>
                    </tr>
                    <!-- �׷�ID BA0011000348 -->
                    <tr>
                        <th>�׷�ID</th>
                        <td><input type="text" name="bt_group_id" value="BA0011000348" class="w100" /></td>
                    </tr>
                    <!-- �Һΰ��� -->
                    <tr>
                        <th>�Һΰ���</th>
                        <td><input type="text" name="quotaopt" value="00" size="2" maxlength="2"  class="w10" /></td>
                    </tr>
                    </table>
                    <!-- ������� ���� ��� ���̺� End -->

                <!-- ���� ��ư ���̺� Start -->
                    <div class="btnset">
                        <table align="center" cellspacing="0" cellpadding="0" class="margin_top_20"> 
                            <tr id="show_pay_btn">
                                <td colspan="2" align="center"> 
                                  <input name="" type="submit" class="submit" value="������û" onclick="return jsf__pay(this.form);" alt="������ ��û�մϴ�" /></a>
                                  <a href="../index.html" class="home">ó������</a>
                     </div>
                                </td>
                            </tr>
                            <!-- ���� ���� ���Դϴ�. �޽��� -->
                            <tr id="show_progress" style="display:none">
                                <td colspan="2" class="center red" >���� ���� ���Դϴ�. ��ø� ��ٷ� �ֽʽÿ�...</td>
                            </tr>
                        </table>
                    </div>
                <!-- ���� ��ư ���̺� End -->

                </div>
        <div class="footer">
            Copyright (c) KCP INC. All Rights reserved.
        </div>

        <!-- ��û���� ����(pay)/���,����(mod) ��û�� ��� -->
        <input type="hidden" name="req_tx"          value="pay"/>
        <input type="hidden" name="pay_method"      value="CARD"/>
        <input type="hidden" name="card_pay_method" value="Batch"/>
        <!-- �ʼ� �׸� : ���� �ݾ�/ȭ����� -->
        <input type="hidden" name="currency" value="410"/>
    </form>
</div>
											
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
                        
</body>
</html>