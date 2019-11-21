package com.hansoin5.artplanet.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hansoin5.artplanet.service.RecPayDTO;
import com.hansoin5.artplanet.service.impl.RecAuthDAO;
import com.hansoin5.artplanet.service.impl.RecPayDAO;
//(RecurringController)에서는 (BLOG)메뉴에서 정기구독 (페이지이동)과 (인증키+결제결과)를 DB에 저장합니다.
@Controller
public class RecurringController {

	@Resource(name = "recAuth")
	private RecAuthDAO authDao;
	@Resource(name = "recPay")
	private RecPayDAO payDao;

	// 인증
	@RequestMapping("RecurringAuthReq.do")
	public String authReq() {
		return "recurring_pay/sample/auth/Requestkey.tiles";
	}////////////// RecurringAuthReq.do
	
	
	
	@RequestMapping("RecurringAuthHub.do")
	public String authHub() {
		return "recurring_pay/sample/auth/pp_cli_hub";
	}////////////// RecurringAuthHub.do

	// DB저장
	@RequestMapping("RecurringAuthRes.do")
	public String authRes(@RequestParam Map map) {
		System.out.println(map.get("batch_key"));
		int affected = authDao.recAuthInsert(map);
		if (affected == 1) {
			System.out.println("배치[인증] DB입력완료");
		}

		return "recurring_pay/sample/auth/result";
	}/////////// RecurringAuthRes.do

	// 결제
	@RequestMapping("RecurringPayOrder.do")
	public String payOrder() {
		return "recurring_pay/sample/payx/order";
	}////////////// RecurringPayOrder.do

	@RequestMapping("RecurringPayHub.do")
	public String payHub() {
		return "recurring_pay/sample/payx/pp_cli_hub";
	}////////// RecurringPayHub.do

	

	@RequestMapping(value = "/RecurringPayRes2", method = RequestMethod.POST)
	public String payRes2(@RequestParam Map map) {
	
		int affected = payDao.recPayInsert(map);

		if (affected == 1) {
			System.out.println("배치[결제] DB입력완료");
			//결제시간을 인증테이블 app_time컬럼에 업데이트합니다
			authDao.authAppTimeUpdate();
			
		}
		//return "recurring_pay/sample/payx/result"; 변경전
		
		return "admin/admBatchKey"; //변경후 
		
	}////////////// RecurringPayRes.do
	

}
