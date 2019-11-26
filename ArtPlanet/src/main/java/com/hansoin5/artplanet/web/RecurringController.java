package com.hansoin5.artplanet.web;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hansoin5.artplanet.service.MemberDTO;
import com.hansoin5.artplanet.service.impl.MemberDAO;
import com.hansoin5.artplanet.service.impl.RecAuthDAO;
import com.hansoin5.artplanet.service.impl.RecPayDAO;
import com.hansoin5.artplanet.service.impl.SubscribeDAO;
//(RecurringController)에서는 (BLOG)메뉴에서 정기구독 (페이지이동)과 (인증키+결제결과)를 DB에 저장합니다.
@Controller
public class RecurringController {
	
	// member 테이블에 접근하는 객체를 주입받습니다.
	@Resource(name = "memberDAO")
	private MemberDAO memberDao;
	
	@Resource(name = "recAuth")
	private RecAuthDAO authDao;
	@Resource(name = "recPay")
	private RecPayDAO payDao;
	@Resource(name = "subscribeDAO")
	private SubscribeDAO subscribeDao;

	// 인증
	@RequestMapping("/RecurringAuthReq.do")
	public String authReq(@RequestParam Map map, Model model) {
		
		model.addAttribute("targetId",map.get("id"));
		System.out.println("map.get(\"loginedId\"):"+map.get("loginedId"));
		List<MemberDTO> list = memberDao.getMemberById(map.get("loginedId").toString());		
		model.addAttribute("name",list.get(0).getName());
		model.addAttribute("memberNo",list.get(0).getMemberNo());
		
		return "recurring_pay/sample/auth/Requestkey.tiles";
	}////////////// RecurringAuthReq.do
	
	
	
	@RequestMapping("/RecurringAuthHub.do")
	public String authHub(@RequestParam Map map, Model model) {
		model.addAttribute("targetId",map.get("targetId"));
		return "recurring_pay/sample/auth/pp_cli_hub";
	}////////////// RecurringAuthHub.do

	// DB저장
	@RequestMapping("/RecurringAuthRes.do")
	public String authRes(@RequestParam Map map) {
		System.out.println(map.get("batch_key"));
		map.put("memberNo", memberDao.getMemberNo(map.get("id").toString()));
		System.out.println("====================================================");
		
		//프로젝트서포트넘버 스트링 하나 얻기
		String projectSupportNo = authDao.projGetProjSupNo();
		System.out.println("프로젝트서포트넘버"+projectSupportNo);
		map.put("projectSupportNo", projectSupportNo);
		
		//아이디 넘기기
		System.out.println("map.get(\"targetId\"):"+map.get("targetId"));
		map.put("targetId", "wnstlr");
		map.put("loginedId",map.get("id").toString());
		map.put("id",map.get("id").toString());//원래있던거
		System.out.println("id : "+map.get("id").toString());
		map.put("app_time", "");
		//낫널이라 오류남 (Cause: java.sql.SQLIntegrityConstraintViolationException: ORA-01400: NULL을)
		//map.put("subscribeNo", "");
		
		int affected = authDao.recAuthInsert(map);
		if (affected == 1) {
			System.out.println("배치[인증] DB입력완료");
			//loginedId와 targetId 필요
			subscribeDao.doSubscribe(map);
			authDao.updateSubscribeNo(map);
		}

		return "recurring_pay/sample/auth/result";
	}/////////// RecurringAuthRes.do

	// 결제
	@RequestMapping("RecurringPayOrder.do")
	public String payOrder() {
		System.out.println("payOrder 안");
		return "recurring_pay/sample/payx/order";
	}////////////// RecurringPayOrder.do

	@RequestMapping("RecurringPayHub.do")
	public String payHub() {
		return "recurring_pay/sample/payx/pp_cli_hub";
	}////////// RecurringPayHub.do

	

	@RequestMapping(value = "/RecurringPayRes2", method = RequestMethod.POST)
	public String payRes2(@RequestParam Map map) {
		System.out.println("왜 정기구독 결제할때 멤버노가 널인거? "+memberDao.getMemberNo(map.get("id").toString()));
		map.put("memberNo", memberDao.getMemberNo(map.get("id").toString()));
		//아이디 넘기기
		map.put("id",map.get("id").toString());
		System.out.println("id : "+map.get("id").toString());
		
		int affected = payDao.recPayInsert(map);

		if (affected == 1) {
			System.out.println("배치[결제] DB입력완료");
			//결제시간을 인증테이블 app_time컬럼에 업데이트합니다
			
			System.out.println("paied_batch:"+map.get("paied_batch"));
			SimpleDateFormat format = new SimpleDateFormat("YY/MM/dd");
			String time = format.format(new Date(System.currentTimeMillis()));
			System.out.println("★☆★☆★☆"+time+"★☆★☆★☆");
			map.put("currentTime", time);
			int updated =authDao.updateApptime(map);
			if (updated == 1)
				System.out.println("★☆★☆★☆배치키로 [앱타임] 갱신완료★☆★☆★☆");
		}
		//return "recurring_pay/sample/payx/result"; 변경전
		
		return "admin/admBatchKey"; //변경후 
		
	}////////////// RecurringPayRes.do
	

}
