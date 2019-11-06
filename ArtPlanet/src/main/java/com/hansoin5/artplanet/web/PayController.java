package com.hansoin5.artplanet.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hansoin5.artplanet.service.impl.ArtPlanetPayDAO;

@Controller
public class PayController {
	
	@Resource(name="payInfo")
	private ArtPlanetPayDAO dao;
	
	@RequestMapping("Order.do")
	public String order()
	{
		//return "pay/sample/order.tiles"; 타일즈적용시 아코디언 버벅거림
		//return "pay/sample/order";   //수정1차
		
		
		return "pay/sample/OrderFinal.tiles";   //수정최종

	}
	
	
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
