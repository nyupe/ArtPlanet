package com.hansoin5.artplanet.web;
 
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hansoin5.artplanet.service.impl.ArtPlanetRecAuthDAO;
 
@Controller
public class RecurringController {
	
	@Resource(name="recAuth")
	private ArtPlanetRecAuthDAO dao;
	//인증
	@RequestMapping("RecurringAuthReq.do")
	public String authReq() {
		return "recurring_pay/sample/auth/Requestkey.tiles";
	}//////////////RecurringAuthReq.do
	
	
	@RequestMapping("RecurringAuthHub.do")
	public String authHub() {
		return "recurring_pay/sample/auth/pp_cli_hub";
	}//////////////RecurringAuthHub.do
	
	
	//DB저장
	@RequestMapping("RecurringAuthRes.do")
	public String authRes(@RequestParam Map map) {
		System.out.println(map.get("batch_key"));
		int affected = dao.recAuthInsert(map);
		if(affected == 1) {
			System.out.println("입력완료");
		}
		
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
