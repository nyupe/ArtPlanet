package com.hansoin5.artplanet.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayController {
	@RequestMapping("Order.do")
	public String order()
	{
		//return "pay/sample/order.tiles"; 타일즈적용시 아코디언 버벅거림
		return "pay/sample/Order2.tiles";   //그냥 jsp 수정2차
		
		
		//return "pay/sample/order";   //수정1차
	}
	
	
	@RequestMapping("Hub.do")
	public String hub() {
		return "pay/sample/pp_cli_hub";
	}////hub
	
	@RequestMapping("Result.do")
	public String result() {
		return "pay/sample/result.tiles";
	}
}
