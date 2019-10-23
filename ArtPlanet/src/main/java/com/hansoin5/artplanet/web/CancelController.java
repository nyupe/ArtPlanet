package com.hansoin5.artplanet.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CancelController {
	
	@RequestMapping("CancelOrder.do")
	public String cancelOrder() {
		//return "cancel/sample/cancel_order";  //민 
	
		return "cancel_re/sample/cancel_order";  //정
	}///cancelOrder
	
	
	@RequestMapping(value="Cancel.do", method=RequestMethod.POST)
	public String cancel() {
		//return "cancel/sample/cancel_jppcli";  //민
		
		return "cancel_re/sample/cancel"; //정
		
	}////cancel
	
	
	
	
}
