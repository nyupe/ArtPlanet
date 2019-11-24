package com.hansoin5.artplanet.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hansoin5.artplanet.service.impl.PayDAO;

@Controller
public class PayController {
	
	@Resource(name="payInfo")
	private PayDAO dao;
	
	@RequestMapping("Order.do")
	public String order(@RequestParam Map map, Model model)
	{
		//return "pay/sample/order.tiles"; 타일즈적용시 아코디언 버벅거림
		//return "pay/sample/order";   //수정1차
		
		/*
		//들어온것 찍어보기
		Set<String> keys = map.keySet();
		for(String key : keys) {
			System.out.println(key);
		}///// - 잘들어옴
		*/
		
		//가격 리퀘스트 영역에 저장 
		model.addAttribute("fee", map.get("fee").toString().replace("원", ""));
		
		return "pay/sample/OrderFinal.tiles";   //수정최종

	}/////order()
	
	
	@RequestMapping("Hub.do")
	public String hub(){
		
		return "pay/sample/pp_cli_hub";
	}////hub
	
	@RequestMapping("Result.do")
	public String result(@RequestParam Map map) {
		//return "pay/sample/result.tiles"; //수정1차
		System.out.println(map.get("tno"));
		int affected = dao.payInsert(map);
		if(affected == 1) {
			System.out.println("입력완료");
		}
		return "pay/sample/ResultFinal.tiles"; //수정최종
		
	}
}
