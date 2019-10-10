package com.hansoin5.artplanet.web;
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
public class RecurringController {
	//인증
	@RequestMapping("RecurringAuthReq.do")
	public String authReq() {
		return "recurring_pay/sample/auth/request_key";
	}//////////////RecurringAuthReq.do
	
	
	@RequestMapping("RecurringAuthHub.do")
	public String authHub() {
		return "recurring_pay/sample/auth/pp_cli_hub";
	}//////////////RecurringAuthHub.do
	
	@RequestMapping("RecurringAuthRes.do")
	public String authRes() {
		return "recurring_pay/sample/auth/result";
	}///////////RecurringAuthRes.do
	
	
	//결제	
	@RequestMapping("RecurringPayOrder.do")
	public String payOrder() {
		return "recurring_pay/sample/payx/order";
	}//////////////RecurringPayOrder.do
	
	@RequestMapping("RecurringPayHub.do")
	public String payHub() {
		return "recurring_pay/sample/payx/pp_cli_hub";
	}//////////RecurringPayHub.do
	
	@RequestMapping("RecurringPayRes.do")
	public String payRes() {
		return "recurring_pay/sample/payx/result";
	}//////////////RecurringPayRes.do
	
	
}
