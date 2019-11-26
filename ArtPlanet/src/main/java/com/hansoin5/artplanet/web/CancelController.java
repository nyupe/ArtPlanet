package com.hansoin5.artplanet.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hansoin5.artplanet.service.impl.CancelDAO;


@Controller
public class CancelController {
	
	@Resource(name="cancel")
	private CancelDAO dao;
	
	
	
	@RequestMapping("CancelOrder.do")
	public String cancelOrder() {
		//return "cancel/sample/cancel_order";  //민 
	
		return "cancel_re/sample/cancel_order";  //정
	}///cancelOrder
	
	
	@RequestMapping(value="Cancel.do", method=RequestMethod.POST)
	public String cancel() {
		//return "cancel/sample/cancel_jppcli";  //민
		System.out.println("그럼안들어와?");
		
		return "cancel_re/sample/cancel"; //정
		
	}////cancel
	
	@RequestMapping(value="CancelSave.do", method=RequestMethod.POST, produces = "text/html;charset=utf-8")
	public String cancelSave(@RequestParam Map map) {
		//,Model model
		System.out.println("안찍히냐1");
		System.out.println(map.get("res_cd"));
		System.out.println(map.get("tno"));
		System.out.println(map.get("res_msg"));
		System.out.println(map.get("memberNo")); //널찍힘
		//Pay테이블에서 memberNo 얻기
		String memberNo = dao.getMemberNoFromPayforCancel(map);
		map.put("memberNo", memberNo);
		System.out.println("※※"+map.get("memberNo"));		
		int affected = dao.cancelInsert(map);
		System.out.println("안찍히냐2");
		
		if(affected == 1) {
			System.out.println("입력완료");
		}///if
	
		//return "forward:AdmUserPayList.ad"; 웹에서 제이슨배열찍힘
		
		//이거 여기서  파라미터 모델로 넘기면 디비에 저장은 되는데 웹에서 오류남
		//model.addAttribute("cancelButtonShow",dao.cancelButtonShowCount());
		
		return "admin/admPay"; 
	}
	/*
	//취소카운 필요없음
	@ResponseBody
	@RequestMapping(value="CancelCount.do", method =RequestMethod.GET , produces = "text/html; charset=UTF-8")
	public String cancelCount(Model model, @RequestParam String tno) {
		System.out.println("cancelButtonShow호출");
		model.addAttribute("cancelButtonShow",dao.cancelButtonShowCount(tno));
		return "";
		
	}/////cancelCount
	*/
	
}
